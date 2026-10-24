local lb1 = redmew.config['lab']
local lb2 = redmew.config['lab-2']

--=================================================================================================

redmew.update_prototype(lb1)

--=================================================================================================

local base_item = data.raw.item['lab']
local entity = redmew.make_tier(lb2)
entity.icons = redmew.reskin_library.make_tinted_item_icons('lab', lb2._tint)

data:extend({
    -- Item
    {
        name = lb2.name,
        type = 'item',
        icons = redmew.reskin_library.make_tinted_item_icons('lab', lb2._tint),
        order = base_item.order,
        place_result = lb2.name,
        stack_size = base_item.stack_size,
        subgroup = base_item.subgroup,
    },
    -- Recipe
    {
        name = lb2.name,
        type = 'recipe',
        enabled = false,
        energy_required = 5,
        ingredients = {
            { type = 'item', name = 'lab', amount = 4 },
            { type = 'item', name = 'advanced-circuit', amount = 40 },
            { type = 'item', name = 'speed-module', amount = 4 },
        },
        results = { { type = 'item', name = lb2.name, amount = 1 } },
    },
    -- Entity
    entity,
    -- Technology
    {
        type = 'technology',
        name = lb2._technology,
        icons = redmew.reskin_library.make_tinted_technology_icons('automation', lb2._tint),
        effects = { { type = 'unlock-recipe', recipe = lb2.name } },
        prerequisites = { 'automation-2', 'speed-module', 'production-science-pack' },
        unit = {
            count = 200,
            ingredients = {
                { 'automation-science-pack', 1 },
                { 'logistic-science-pack', 1 },
                { 'chemical-science-pack', 1 },
                { 'utility-science-pack', 1 },
                { 'production-science-pack', 1 },
            },
            time = 60,
        },
        order = 'a-a-d',
    },
})
