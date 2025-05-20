local item_sounds = require '__base__.prototypes.item_sounds'
local hit_effects = require '__base__.prototypes.entity.hit-effects'

data:extend({
    -- Recipe
    {
        type = 'recipe',
        name = 'seismothermic-generator',
        energy_required = 10,
        enabled = false,
        ingredients = {
            { type = 'item', name = 'steel-plate', amount = 20 },
            { type = 'item', name = 'electric-engine-unit', amount = 5 },
            { type = 'item', name = 'advanced-circuit', amount = 10 },
            { type = 'item', name = 'concrete', amount = 20 },
            { type = 'item', name = 'low-density-structure', amount = 5 },
        },
        results = { { type = 'item', name = 'seismothermic-generator', amount = 1 } },
    },
    -- Item
    {
        type = 'item',
        name = 'seismothermic-generator',
        icon = '__redmew-data__/graphics/entity/thermal-plant/thermal-plant-icon.png',
        subgroup = 'energy',
        order = 'g[thermal-energy]-a[seismthermic-generator]',
        inventory_move_sound = item_sounds.electric_large_inventory_move,
        pick_sound = item_sounds.electric_large_inventory_pickup,
        drop_sound = item_sounds.electric_large_inventory_move,
        place_result = 'seismothermic-generator',
        stack_size = 50,
    },
    -- Property
    {
        name = 'thermal',
        type = 'surface-property',
        is_time = false,
        default_value = 100,
    },
    -- Entity
    {
        type = 'solar-panel',
        name = 'seismothermic-generator',
        icon = '__redmew-data__/graphics/entity/thermal-plant/thermal-plant-icon.png',
        flags = { 'placeable-neutral', 'player-creation' },
        minable = { mining_time = 0.25, result = 'seismothermic-generator' },
        fast_replaceable_group = 'seismothermic-generator',
        max_health = 500,
        corpse = 'roboport-remnants',
        dying_explosion = 'roboport-explosion',
        collision_box = { { -1.7, -1.7 }, { 1.7, 1.7 } },
        selection_box = { { -2, -2 }, { 2, 2 } },
        damaged_trigger_effect = hit_effects.entity(),
        resistances = {
            {
                type = 'fire',
                percent = 60,
            },
            {
                type = 'impact',
                percent = 30,
            },
        },
        energy_source = {
            type = 'electric',
            usage_priority = 'solar',
        },
        solar_coefficient_property = 'thermal',
        performance_at_day = 1,
        performance_at_night = 1,
        picture = {
            layers = {
                {
                    filename = '__redmew-data__/graphics/entity/thermal-plant/thermal-plant-hr-shadow.png',
                    priority = 'high',
                    size = { 900, 500 },
                    line_length = 1,
                    lines_per_file = 1,
                    frame_count = 1,
                    shift = util.by_pixel(0, -11),
                    scale = 0.4,
                },
                {
                    filename = '__redmew-data__/graphics/entity/thermal-plant/thermal-plant-hr-animation-2.png',
                    priority = 'high',
                    size = { 330, 410 },
                    line_length = 2,
                    lines_per_file = 8,
                    frame_count = 16,
                    animation_speed = 0.25,
                    shift = util.by_pixel(0, -11),
                    scale = 0.4,
                },
                {
                    filename = '__redmew-data__/graphics/entity/thermal-plant/thermal-plant-hr-emission-2.png',
                    priority = 'high',
                    size = { 330, 410 },
                    line_length = 2,
                    lines_per_file = 8,
                    frame_count = 16,
                    animation_speed = 0.25,
                    shift = util.by_pixel(0, -11),
                    scale = 0.4,
                    draw_as_glow = true,
                    blend_mode = 'additive',
                },
            },
        },
        impact_category = 'metal',
        production = '1600kW',
    },
    -- Technology
    {
        type = 'technology',
        name = 'seismothermic-generator',
        icon = '__redmew-data__/graphics/entity/thermal-plant/thermal-plant-technology.png',
        icon_size = 256,
        effects = {
            {
                type = 'unlock-recipe',
                recipe = 'seismothermic-generator',
            },
        },
        prerequisites = { 'space-science-pack' },
        unit = {
            count = 800,
            ingredients = {
                { 'automation-science-pack', 1 },
                { 'logistic-science-pack', 1 },
                { 'military-science-pack', 1 },
                { 'chemical-science-pack', 1 },
                { 'production-science-pack', 1 },
                { 'utility-science-pack', 1 },
                { 'space-science-pack', 1 },
            },
            time = 60,
        },
    },
})
