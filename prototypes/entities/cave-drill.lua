local hit_effects = require '__base__.prototypes.entity.hit-effects'
local sounds = require '__base__.prototypes.entity.sounds'

circuit_connector_definitions['cave-drill'] = circuit_connector_definitions.create_vector(universal_connector_template, {
    { variation = 7, main_offset = util.by_pixel(-113.5, 80), shadow_offset = util.by_pixel(-113.5, 80), show_shadow = true },
    { variation = 7, main_offset = util.by_pixel(-113.5, 80), shadow_offset = util.by_pixel(-113.5, 80), show_shadow = true },
    { variation = 7, main_offset = util.by_pixel(-113.5, 80), shadow_offset = util.by_pixel(-113.5, 80), show_shadow = true },
    { variation = 7, main_offset = util.by_pixel(-113.5, 80), shadow_offset = util.by_pixel(-113.5, 80), show_shadow = true },
})

data:extend({
    {
        type = 'item',
        name = 'cave-drill',
        icon = '__redmew-data__/graphics/icons/cave-drill.png',
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = 'extraction-machine',
        order = 'a[items]-d[cave-drill]',
        place_result = 'cave-drill',
        stack_size = 20,
        weight = 200 * kg,
    },
    {
        type = 'recipe',
        name = 'cave-drill',
        category = 'crafting-with-fluid',
        energy_required = 60,
        results = { { type = 'item', name = 'cave-drill', amount = 1 } },
        enabled = false,
        ingredients = {
            { type = 'item', name = 'processing-unit', amount = 200 },
            { type = 'item', name = 'iron-gear-wheel', amount = 500 },
            { type = 'item', name = 'steel-plate', amount = 300 },
            { type = 'item', name = 'electric-engine-unit', amount = 50 },
            { type = 'fluid', name = 'lubricant', amount = 300 },
        },
    },
    {
        type = 'mining-drill',
        name = 'cave-drill',
        icon = '__redmew-data__/graphics/icons/cave-drill.png',
        icon_size = 64,
        flags = { 'placeable-neutral', 'placeable-player', 'player-creation' },
        minable = { mining_time = 1.5, result = 'cave-drill' },
        max_health = 1200,
        resource_drain_rate_percent = 75,
        corpse = 'big-remnants',
        dying_explosion = 'big-explosion',
        collision_box = {{-4.20, -4.20}, {4.20, 4.20}},
        selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
        energy_source = {
            type = 'electric',
            emissions_per_minute = { pollution = 200 },
            usage_priority = 'secondary-input',
        },
        energy_usage = '10000kW',
        heating_energy = mods['space-age'] and '600kW' or nil,
        resource_categories = mods['space-age'] and { 'basic-solid', 'hard-solid' } or { 'basic-solid' },
        drops_full_belt_stacks = mods['space-age'] and true or nil,
        input_fluid_box = {
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            volume = 200,
            pipe_connections = {
                { direction = defines.direction.west, position = { -4, 3 } },
                { direction = defines.direction.west, position = { -4, -3 } },
                { direction = defines.direction.east, position = { 4, -3 } },
                { direction = defines.direction.east, position = { 4, 3 } },
            },
        },
        mining_speed = 20,
        output_priority = 'primary-output',
        vector_to_place_result = { 0, 4.75 },
        module_slots = 4,
        circuit_connector = circuit_connector_definitions['cave-drill'],
        circuit_wire_max_distance = default_circuit_wire_max_distance,
        resource_searching_radius = 24.49,
        radius_visualisation_picture = {
            filename = '__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png',
            width = 12,
            height = 12,
        },
        monitor_visualization_tint = { r = 78, g = 173, b = 255 },
        working_sound = {
            sound = {
                filename = '__redmew-data__/sounds/cave-drill.ogg',
                volume = 2,
            },
            max_sounds_per_type = 1, -- Limits the number of overlapping sounds
            fade_in_ticks = 4, -- Smooth fade-in effect for sound
            fade_out_ticks = 20, -- Smooth fade-out effect for sound
        },
        vehicle_impact_sound = sounds.generic_impact,
        open_sound = sounds.drill_open,
        close_sound = sounds.drill_close,
        graphics_set = {
            always_draw_idle_animation = true,
            idle_animation = {
                layers = {
                    {
                        filename = '__redmew-data__/graphics/entity/cave-drill/cave-drill-hr-shadow.png',
                        priority = 'high',
                        width = 1400,
                        height = 1400,
                        frame_count = 1,
                        repeat_count = 1,
                        animation_speed = 0.5,
                        draw_as_shadow = true,
                        scale = 0.45,
                    },
                    {
                        filename = '__redmew-data__/graphics/entity/cave-drill/cave-drill-big.png',
                        priority = 'high',
                        width = 640,
                        height = 640,
                        frame_count = 1,

                        animation_speed = 0.5,
                        draw_as_shadow = false,
                        scale = 0.5,
                    },
                },
            },
            working_visualisations = {
                {
                    fadeout = true,
                    sync_fadeout = true,
                    always_draw = true,
                    constant_speed = true,
                    animation = {
                        layers = {
                            {
                                filename = '__redmew-data__/graphics/entity/cave-drill/cave-drill-hr-shadow.png',
                                priority = 'high',
                                width = 1400,
                                height = 1400,
                                frame_count = 1,
                                repeat_count = 120,
                                animation_speed = 0.5,
                                draw_as_shadow = true,
                                scale = 0.45,
                            },
                            {
                                priority = 'high',
                                width = 704,
                                height = 704,
                                frame_count = 120,
                                animation_speed = 0.5,
                                scale = 0.45,
                                draw_as_light = true,
                                blend_mode = 'additive',
                                stripes = {
                                    {
                                        filename = '__redmew-data__/graphics/entity/cave-drill/cave-drill-hr-animation-emission-1.png',
                                        width_in_frames = 8,
                                        height_in_frames = 8,
                                    },
                                    {
                                        filename = '__redmew-data__/graphics/entity/cave-drill/cave-drill-hr-animation-emission-2.png',
                                        width_in_frames = 8,
                                        height_in_frames = 8,
                                    },
                                },
                            },
                            {
                                priority = 'high',
                                width = 704,
                                height = 704,
                                frame_count = 120,
                                animation_speed = 0.5,
                                scale = 0.45,
                                stripes = {
                                    {
                                        filename = '__redmew-data__/graphics/entity/cave-drill/cave-drill-hr-animation-1.png',
                                        width_in_frames = 8,
                                        height_in_frames = 8,
                                    },
                                    {
                                        filename = '__redmew-data__/graphics/entity/cave-drill/cave-drill-hr-animation-2.png',
                                        width_in_frames = 8,
                                        height_in_frames = 8,
                                    },
                                },
                            },
                        },
                    },
                    reset_animation_when_frozen = false,
                },
            },
        },
    },
    {
        type = 'technology',
        name = 'cave-drill',
        icon = '__redmew-data__/graphics/technology/cave-drill.png',
        icon_size = 256,
        effects = { { type = 'unlock-recipe', recipe = 'cave-drill' } },
        prerequisites = { 'electric-engine', 'automation-3' },
        unit = {
            count = 2500,
            ingredients = {
                { 'automation-science-pack', 1 },
                { 'logistic-science-pack', 1 },
                { 'chemical-science-pack', 1 },
                { 'utility-science-pack', 1 },
                { 'production-science-pack', 1 },
                { 'space-science-pack', 1 },
            },
            time = 20,
        },
        order = 'c-g-b-z',
    },
})
