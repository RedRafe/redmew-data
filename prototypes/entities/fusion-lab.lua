local hit_effects = require '__base__.prototypes.entity.hit-effects'
local item_sounds = require '__base__.prototypes.item_sounds'
local sounds = require '__base__.prototypes.entity.sounds'

data:extend {
    {
        type = 'item',
        name = 'fusion-lab',
        icon = '__redmew-data__/graphics/icons/photometric-lab-icon.png',
        subgroup = 'production-machine',
        order = 'z[lab]-b[fusion-lab]',
        inventory_move_sound = item_sounds.lab_inventory_move,
        pick_sound = item_sounds.lab_inventory_pickup,
        drop_sound = item_sounds.lab_inventory_move,
        place_result = 'fusion-lab',
        weight = 200 * kg,
        stack_size = 5,
    },
    {
        type = 'recipe',
        name = 'fusion-lab',
        order = 'z[lab]-b[fusion-lab]',
        enabled = false,
        energy_required = 10,
        ingredients = {
            { type = 'item', name = 'lab', amount = 5 },
            { type = 'item', name = 'refined-concrete', amount = 500 },
            { type = 'item', name = 'steel-plate', amount = 500 },
            { type = 'item', name = 'productivity-module-3', amount = 100 },
            { type = 'item', name = 'low-density-structure', amount = 200 },
        },
        results = {
            { type = 'item', name = 'fusion-lab', amount = 1 },
        },
        allow_productivity = false,
    },
    {
        type = 'lab',
        name = 'fusion-lab',
        selection_priority = 100,
        icon = '__redmew-data__/graphics/icons/photometric-lab-icon.png',
        flags = { 'placeable-player', 'player-creation' },
        minable = { mining_time = 0.2, result = 'fusion-lab' },
        max_health = 350,
        corpse = 'nuclear-reactor-remnants',
        dying_explosion = 'lab-explosion',
        collision_box = { { -2.2, -2.2 }, { 2.2, 2.2 } },
        selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
        damaged_trigger_effect = hit_effects.entity(),
        on_animation = {
            layers = {
                util.sprite_load('__redmew-data__/graphics/entity/fusion-lab/photometric-lab-hr-shadow', {
                    frame_count = 1,
                    scale = 0.5,
                    repeat_count = 80,
                    animation_speed = 0.4,
                    draw_as_shadow = true,
                }),
                util.sprite_load('__redmew-data__/graphics/entity/fusion-lab/photometric-lab-hr-animation', {
                    frame_count = 80,
                    animation_speed = 0.4,
                    scale = 0.5,
                }),
                util.sprite_load('__redmew-data__/graphics/entity/fusion-lab/photometric-lab-hr-emission', {
                    frame_count = 80,
                    animation_speed = 0.4,
                    scale = 0.5,
                    blend_mode = 'additive',
                    draw_as_glow = true,
                }),
            },
        },
        off_animation = {
            layers = {
                util.sprite_load('__redmew-data__/graphics/entity/fusion-lab/photometric-lab-hr-shadow', {
                    frame_count = 1,
                    scale = 0.5,
                    repeat_count = 80,
                    animation_speed = 0.4,
                    draw_as_shadow = true,
                }),
                util.sprite_load('__redmew-data__/graphics/entity/fusion-lab/photometric-lab-hr-animation', {
                    frame_count = 80,
                    animation_speed = 0.4,
                    scale = 0.5,
                }),
            },
        },
        working_sound = {
            sound = {
                filename = '__base__/sound/lab.ogg',
                volume = 0.65,
                max_sounds_per_prototype = 2,
            },
            fade_in_ticks = 4,
            fade_out_ticks = 20,
        },
        impact_category = 'glass',
        open_sound = { filename = '__base__/sound/open-close/lab-open.ogg', volume = 0.6 },
        close_sound = { filename = '__base__/sound/open-close/lab-close.ogg', volume = 0.6 },
        energy_source = {
            type = 'burner',
            fuel_categories = { 'nuclear' },
            effectivity = 1,
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            light_flicker = {
                color = { 0, 0, 0 },
                minimum_intensity = 0.7,
                maximum_intensity = 0.95,
            },
        },
        energy_usage = '10MW',
        researching_speed = 2,
        module_slots = 4,
        inputs = table.deepcopy(data.raw.lab.lab.inputs),
        science_pack_drain_rate_percent = 50,
        icons_positioning = {
            { inventory_index = defines.inventory.lab_modules, shift = { 0, 1.6 } },
            { inventory_index = defines.inventory.lab_input, shift = { 0, 0.4 }, max_icons_per_row = 6, separation_multiplier = 1 / 1.1 },
        },
    },
    {
        type = 'technology',
        name = 'fusion-lab',
        icon = '__redmew-data__/graphics/technology/fusion-lab.png',
        icon_size = 256,
        effects = {
            {
                type = 'unlock-recipe',
                recipe = 'fusion-lab',
            },
        },
        prerequisites = { 'space-science-pack' },
        unit = {
            count = 10000,
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
}
