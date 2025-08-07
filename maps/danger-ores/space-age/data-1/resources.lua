-- Credits to "Everything on Nauvis" mod by Spaghetti2364
---------------------------------------------------------

local resource_autoplace = require 'resource-autoplace'
local base_sounds = require '__base__.prototypes.entity.sounds'
local simulations = require '__space-age__.prototypes.factoriopedia-simulations'

local stone_driving_sound = {
    sound = {
        filename = '__base__/sound/driving/vehicle-surface-stone.ogg',
        volume = 0.8,
        advanced_volume_control = { fades = { fade_in = { curve_type = 'cosine', from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } } },
    },
    fade_ticks = 6,
}

data:extend({
    -- Holmium
    {
        type = 'autoplace-control',
        name = 'holmium-ore',
        localised_name = { '', '[entity=holmium-ore] ', { 'entity-name.holmium-ore' } },
        richness = true,
        order = 'b-c',
        category = 'resource',
    },
    {
        type = 'resource',
        name = 'holmium-ore',
        icon = '__space-age__/graphics/icons/holmium-ore.png',
        flags = { 'placeable-neutral' },
        order = 'a-b-e',
        tree_removal_probability = 0.7,
        tree_removal_max_distance = 32 * 32,
        walking_sound = base_sounds.ore,
        driving_sound = stone_driving_sound,
        minable = {
            mining_particle = 'stone-particle', -- TODO: Add particle - There is an actual holmium-ore-particle-1.png in space-age\graphics\particle\holmium-ore-particle
            mining_time = 2,
            result = 'holmium-ore',
        },
        category = 'hard-solid',
        collision_box = { { -0.1, -0.1 }, { 0.1, 0.1 } },
        selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        autoplace = resource_autoplace.resource_autoplace_settings {
            name = 'holmium-ore',
            order = 'c-holmium',
            base_density = 0.4,
            base_spots_per_km2 = 1.25,
            has_starting_area_placement = false,
            random_spot_size_minimum = 2,
            random_spot_size_maximum = 4,
            regular_rq_factor_multiplier = 1,
        },
        stage_counts = { 15000, 9500, 5500, 2900, 1300, 400, 150, 80 },
        stages = {
            sheet = {
                filename = '__redmew-data__/graphics/entity/holmium-ore/holmium-ore-patches.png',
                priority = 'extra-high',
                width = 128,
                height = 128,
                frame_count = 8,
                variation_count = 8,
                scale = 0.5,
            },
        },
        effect_animation_period = 5,
        effect_animation_period_deviation = 1,
        effect_darkness_multiplier = 3.6,
        min_effect_alpha = 0.2,
        max_effect_alpha = 0.3,
        mining_visualisation_tint = { r = 1, g = 0, b = 0.9, a = 1 },
        map_color = { 1, 0, 0.9 },
    },
})

for _, item in pairs({
    { control = 'calcite', resource = 'calcite' },
    { control = 'tungsten_ore', resource = 'tungsten-ore' },
    { control = 'holmium-ore', resource = 'holmium-ore' },
    { control = 'sulfuric_acid_geyser', resource = 'sulfuric-acid-geyser' },
    { control = 'lithium_brine', resource = 'lithium-brine' },
    { control = 'fluorine_vent', resource = 'fluorine-vent' },
}) do
    data.raw.planet.nauvis.map_gen_settings.autoplace_controls[item.control] = {}
    data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings[item.resource] = {}
end

--data.raw.planet.nauvis.map_gen_settings.property_expression_names['entity:sulfuric-acid-geyser:probability'] = 'vulcanus_sulfuric_acid_geyser_probability'
--data.raw.planet.nauvis.map_gen_settings.property_expression_names['entity:sulfuric-acid-geyser:richness'] = 'vulcanus_sulfuric_acid_geyser_richness'

-- Add calcite to volcanic rocks
table.insert(data.raw['simple-entity']['big-volcanic-rock'].minable.results, { type = 'item', name = 'calcite', amount_min = 2, amount_max = 8 })
table.insert(data.raw['simple-entity']['huge-volcanic-rock'].minable.results, { type = 'item', name = 'calcite', amount_min = 3, amount_max = 15 })

--- Set vulcane as resource
--data.raw['autoplace-control']['vulcanus_volcanism'].order = 'z-volcanism'
--data.raw['autoplace-control']['vulcanus_volcanism'].localised_description = { 'autoplace-control-names.vulcanus_volcanism_description' }
--data.raw['autoplace-control']['vulcanus_volcanism'].category = 'resource'

data.raw['noise-expression']['aquilo_crude_oil_spots'].expression = '0' --  This removes aquilo islands for crude oil

--- Rocks
data.raw['simple-entity']['copper-stromatolite'].autoplace = {
    control = 'rocks',
    order = 'a[doodad]-a[rock]-b[big]',
    probability_expression = 'multiplier * control * (region_box + rock_density - penalty)',
    local_expressions = {
        multiplier = 0.07,
        penalty = 1.3,
        region_box = 'range_select_base(moisture, 0.35, 1, 0.2, -10, 0)',
        control = 'control:rocks:size',
    },
}
data.raw['simple-entity']['iron-stromatolite'].autoplace = {
    control = 'rocks',
    order = 'a[doodad]-a[rock]-a[huge]',
    probability_expression = 'multiplier * control * (region_box + rock_density - penalty)',
    local_expressions = {
        multiplier = 0.07,
        penalty = 1.9,
        region_box = 'range_select_base(moisture, 0.35, 1, 0.2, -10, 0)',
        control = 'control:rocks:size',
    },
}
data.raw['simple-entity']['big-fulgora-rock'].autoplace = {
    control = 'rocks',
    order = 'a[doodad]-a[rock]-b[big]',
    probability_expression = 'multiplier * control * (region_box + rock_density - penalty)',
    local_expressions = {
        multiplier = 0.19,
        penalty = 1.7,
        region_box = 'range_select_base(moisture, 0.35, 1, 0.2, -10, 0)',
        control = 'control:rocks:size',
    },
}

for _, entity in pairs(data.raw['simple-entity']) do
    if not redmew.string.starts_with(entity.name, 'parameter') then
        entity.collision_mask = nil
    end
end

for _, plant in pairs(data.raw.plant) do
    if plant.autoplace and plant.autoplace.tile_restriction then
        plant.autoplace.tile_restriction = nil
    end
end
