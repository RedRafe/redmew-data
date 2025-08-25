data:extend({
    -- from base 'resource_autoplace_all_patches'
    {
        type = 'noise-function',
        name = 'redmew_autoplace',
        parameters = {
            'base_density',
            'base_spots_per_km2',
            'candidate_spot_count',
            'frequency_multiplier',
            'random_spot_size_minimum',
            'random_spot_size_maximum',
            'regular_blob_amplitude_multiplier', -- Amplitude of spot 'blob noise' relative to typical spot amplitude
            'regular_patch_set_count',
            'regular_patch_set_index',
            'regular_rq_factor', -- rq_factor is the ratio of the radius of a patch to the cube root of its quantity,
            -- i.e. radius of a quantity=1 patch; higher values = fatter, shallower patches
            'seed1',
            'size_multiplier',
            'min_elevation', -- does not place below this threshold, 0 = water level
            'starting_radius', -- does not place inside the starting radius
        },
        expression = 'regular_patches',
        local_expressions = {
            -- Since starting and regular spots get maxed together, the basement value should be the lower of the two.
            -- This value needs to be low enough that any noise added to it is still below zero, so that we don't get bits of ores
            -- sticking out between spot noise spots. It also needs to be constant because that's how the spot noise op works.
            -- Simply using -infinity would work, but calculating it based on blob amplitude:
            --   a) looks nicer if you render the value on a map preview
            --   b) acts as a check on our blob_amplitude calculations
            basement_value = '-6 * regular_blob_amplitude_at(regular_blob_amplitude_maximum_distance)',

            blobs0 = [[
                basis_noise{    x = x,
                                y = y,
                                seed0 = map_seed,
                                seed1 = seed1,
                                input_scale = 1/8,
                                output_scale = 1
            } + basis_noise{    x = x,
                                y = y,
                                seed0 = map_seed,
                                seed1 = seed1,
                                input_scale = 1/24,
                                output_scale = 1
            }]],
            double_density_distance = 1900, -- Distance at which patches have twice as much stuff in them.
            regular_patch_fade_in_distance = 500,
            water_mask = 'if(0 >= elevation, 100 * min(0 - elevation, 1), -inf)',

            -- Regular patches
            regular_patches = [[if(((elevation > 0) * (distance > starting_radius) > 0),
                spot_noise{ 
                            x = x,
                            y = y,
                            density_expression = regular_density_at(distance),
                            spot_quantity_expression = regular_spot_quantity_expression,
                            spot_radius_expression = min(32, regular_rq_factor * regular_spot_quantity_expression ^ (1/3)),
                            spot_favorability_expression = 1,
                            seed0 = map_seed,
                            seed1 = seed1,
                            region_size = 1024,
                            candidate_spot_count = candidate_spot_count,
                            suggested_minimum_candidate_point_spacing = 45.254833995939045,
                            skip_span = regular_patch_set_count,
                            skip_offset = regular_patch_set_index,
                            hard_region_target_quantity = 0,
                            basement_value = basement_value,
                            maximum_spot_basement_radius = 128
                } + (blobs0 + basis_noise{  
                            x = x,
                            y = y,
                            seed0 = map_seed,
                            seed1 = seed1,
                            input_scale = 1/64,
                            output_scale = 1.5
                } - 1/3) * regular_blob_amplitude_at(distance),
                -inf)
            ]],
            regular_blob_amplitude_maximum_distance = 'double_density_distance',
            regular_spot_quantity_expression = 'random_penalty_between(random_spot_size_minimum, random_spot_size_maximum, 1) * regular_spot_quantity_base_at(distance)',
        },
        local_functions = {
            regular_density_at = {
                parameters = { 'distance' },
                expression = 'base_density * frequency_multiplier * size_multiplier',
            },
            regular_spot_quantity_base_at = {
                parameters = { 'distance' },
                expression = '1000000 / base_spots_per_km2 / frequency_multiplier * regular_density_at(distance)',
            },
            regular_spot_height_typical_at = {
                parameters = { 'distance' },
                expression = '((random_spot_size_minimum + random_spot_size_maximum) / 2 * regular_spot_quantity_base_at(distance)) ^ (1/3) / (pi/3 * regular_rq_factor ^ 2)',
            },
            regular_blob_amplitude_at = {
                parameters = { 'distance' },
                expression = 'regular_blob_amplitude_multiplier * min(regular_spot_height_typical_at(regular_blob_amplitude_maximum_distance), regular_spot_height_typical_at(distance))',
            },
        },
    },

})

return {
    ---@param params table
    ---@field name string
    ---@field base_density? default 1
    ---@field base_spots_per_km2? default 2.5
    ---@field candidate_spot_count? default 21
    ---@field min_elevation? default 0
    ---@field random_spot_size_maximum? default 2
    ---@field random_spot_size_minimum? default 0.25
    ---@field regular_blob_amplitude_multiplier? default 1
    ---@field regular_rq_factor_multiplier? default 1
    ---@field seed1? default 137
    ---@field starting_radius? default `starting_area_radius`
    ---@field autoplace_control_name?
    ---@field frequency_multiplier? default 1, used if no `autoplace_control_name` has been provided
    ---@field size_multiplier? default 1, used if no `autoplace_control_name` has been provided
    entity_autoplace = function(params)
        local name = ('redmew_autoplace_%s'):format(params.name)

        if not data.raw['noise-expression'][name] then
            local frequency_multiplier = params.frequency_multiplier
            local size_multiplier = params.frequency_multiplier

            if params.autoplace_control_name then
                frequency_multiplier = ('var("control:%s:frequency")'):format(params.autoplace_control_name)
                size_multiplier = ('var("control:%s:size")'):format(params.autoplace_control_name)
            end

            data:extend({
                {
                    type = 'noise-expression',
                    name = name,
                    expression = 'redmew_autoplace{\z
                        base_density = ' .. (params.base_density or 1) .. ',\z
                        base_spots_per_km2 = ' .. (params.base_spots_per_km2 or 2.5) .. ',\z
                        candidate_spot_count = ' .. (params.candidate_spot_count or 21) .. ',\z
                        frequency_multiplier = ' .. (frequency_multiplier or 1) .. ',\z
                        min_elevation = ' .. (params.min_elevation or 0) ..',\z
                        random_spot_size_minimum = ' .. (params.random_spot_size_minimum or 0.25) .. ',\z
                        random_spot_size_maximum = ' .. (params.random_spot_size_maximum or 2) .. ',\z
                        regular_blob_amplitude_multiplier = ' .. ((params.regular_blob_amplitude_multiplier or 1) / 8) .. ',\z
                        regular_patch_set_count = default_regular_resource_patch_set_count' .. ',\z
                        regular_patch_set_index = 0' .. ',\z
                        regular_rq_factor = ' .. ((params.regular_rq_factor_multiplier or 1) / 10) .. ',\z
                        seed1 = ' .. (params.seed1 or 137) .. ',\z
                        size_multiplier = ' .. (size_multiplier or 1) .. ',\z
                        starting_radius = ' .. (params.starting_radius or 'starting_area_radius') ..
                    '}'
                }
            })
        end

        return name
    end
}