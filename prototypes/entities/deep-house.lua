local name = 'deep-house'

local hit_effects = require '__base__.prototypes.entity.hit-effects'
local item_sounds = require '__base__.prototypes.item_sounds'
local sounds = require '__base__.prototypes.entity.sounds'

data:extend({
    -- Item
    {
        type = 'item',
        name = name,
        icon = '__redmew-data__/graphics/icons/strongbox.png',
        subgroup = 'storage',
        order = 'a[items]-d[deep-house]',
        inventory_move_sound = item_sounds.metal_chest_inventory_move,
        pick_sound = item_sounds.metal_chest_inventory_pickup,
        drop_sound = item_sounds.metal_chest_inventory_move,
        place_result = name,
        stack_size = 10,
    },
    -- Recipe
    {
        type = 'recipe',
        name = name,
        energy_required = 30,
        enabled = false,
        ingredients = {
            { type = 'item', name = 'steel-chest', amount = 4 },
            { type = 'item', name = 'energy-shield-equipment', amount = 4 },
            { type = 'item', name = 'efficiency-module', amount = 16 },
        },
        results = { { type = 'item', name = name, amount = 1 } },
    },
    -- Entity
    {
        type = 'container',
        name = name,
        icon = '__redmew-data__/graphics/icons/strongbox.png',
        flags = { 'placeable-neutral', 'player-creation' },
        minable = { mining_time = 0.5, result = name },
        max_health = 4000,
        corpse = 'steel-furnace-remnants',
        dying_explosion = 'steel-furnace-explosion',
        open_sound = sounds.metallic_chest_open,
        close_sound = sounds.metallic_chest_close,
        resistances = {
            {
                type = 'fire',
                percent = 90,
            },
            {
                type = 'impact',
                percent = 60,
            },
        },
        collision_box = { { -0.8, -0.8 }, { 0.8, 0.8 } },
        selection_box = { { -1, -1 }, { 1, 1 } },
        damaged_trigger_effect = hit_effects.entity(),
        fast_replaceable_group = 'container',
        inventory_size = 1,
        inventory_type = 'with_custom_stack_size',
        inventory_properties = { stack_size_min = 1e9, stack_size_ovverride = {} },
        impact_category = 'metal',
        icon_draw_specification = { scale = 0.7 },
        picture = {
            filename = '__redmew-data__/graphics/entity/strongbox.png',
            priority = 'extra-high',
            width = 340,
            height = 340,
            scale = 0.25,
        },
        circuit_connector = circuit_connector_definitions['chest'],
        circuit_wire_max_distance = default_circuit_wire_max_distance,
    },
    -- Technology
    {
        type = 'technology',
        name = name,
        icon = '__redmew-data__/graphics/technology/strongbox.png',
        icon_size = 340,
        effects = {
            { type = 'unlock-recipe', recipe = name },
        },
        prerequisites = { 'efficiency-module', 'chemical-science-pack', 'energy-shield-equipment' },
        unit = {
            count = 200,
            ingredients = {
                { 'automation-science-pack', 1 },
                { 'logistic-science-pack', 1 },
                { 'chemical-science-pack', 1 },
            },
            time = 30,
        },
        order = 'c-a',
    },
})
