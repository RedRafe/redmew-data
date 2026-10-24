local bc1 = redmew.config['beacon']
local bc2 = redmew.config['beacon-2']

--=================================================================================================

redmew.update_prototype(bc1)

--=================================================================================================

local base_item = data.raw.item['beacon']
local entity = redmew.make_tier(bc2)
entity.icons = redmew.reskin_library.make_tinted_item_icons('beacon', bc2._tint)

data:extend({
    -- Item
    {
        name = bc2.name,
        type = 'item',
        icons = redmew.reskin_library.make_tinted_item_icons('beacon', bc2._tint),
        order = base_item.order,
        place_result = bc2.name,
        stack_size = base_item.stack_size,
        subgroup = base_item.subgroup,
    },
    -- Recipe
    {
        name = bc2.name,
        type = 'recipe',
        enabled = false,
        energy_required = 10,
        ingredients = {
            { type = 'item', name = 'beacon', amount = 4 },
            { type = 'item', name = 'efficiency-module', amount = 4 },
            { type = 'item', name = 'refined-concrete', amount = 80 },
        },
        results = { { type = 'item', name = bc2.name, amount = 1 } },
    },
    -- Entity
    entity,
    -- Technology
    {
        type = 'technology',
        name = bc2._technology,
        icons = redmew.reskin_library.make_tinted_technology_icons('effect-transmission', bc2._tint),
        effects = { { type = 'unlock-recipe', recipe = bc2.name } },
        prerequisites = { 'effect-transmission', 'efficiency-module', 'utility-science-pack' },
        unit = {
            count = 250,
            ingredients = {
                { 'automation-science-pack', 1 },
                { 'logistic-science-pack', 1 },
                { 'chemical-science-pack', 1 },
                { 'utility-science-pack', 1 },
                { 'production-science-pack', 1 },
            },
            time = 60,
        },
        order = 'd-b',
    },
})
