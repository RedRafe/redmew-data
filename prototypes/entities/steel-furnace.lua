local sf1 = redmew.config['steel-furnace']
local sf2 = redmew.config['steel-furnace-2']

--=================================================================================================

redmew.update_prototype(sf1)

--=================================================================================================

local base_item = data.raw.item['steel-furnace']
local entity = redmew.make_tier(sf2)
entity.icons = redmew.reskin_library.make_tinted_item_icons('steel-furnace', sf2._tint)

-- Double the energy draw if the furnace is electric; burners scale their fuel use with crafting speed
if entity.energy_usage then
    entity.energy_usage = redmew.string.msv(entity.energy_usage, 2)
end

data:extend({
    -- Item
    {
        name = sf2.name,
        type = 'item',
        icons = redmew.reskin_library.make_tinted_item_icons('steel-furnace', sf2._tint),
        order = base_item.order,
        place_result = sf2.name,
        stack_size = base_item.stack_size,
        subgroup = base_item.subgroup,
    },
    -- Recipe
    {
        name = sf2.name,
        type = 'recipe',
        enabled = false,
        energy_required = 5,
        ingredients = {
            { type = 'item', name = 'steel-furnace', amount = 2 },
            { type = 'item', name = 'steel-plate', amount = 40 },
            { type = 'item', name = 'refined-concrete', amount = 40 },
        },
        results = { { type = 'item', name = sf2.name, amount = 1 } },
    },
    -- Entity
    entity,
    -- Technology
    {
        type = 'technology',
        name = sf2._technology,
        icons = redmew.reskin_library.make_tinted_technology_icons('steel-processing', sf2._tint),
        effects = { { type = 'unlock-recipe', recipe = sf2.name } },
        prerequisites = { 'steel-processing', 'logistic-science-pack' },
        unit = {
            count = 100,
            ingredients = {
                { 'automation-science-pack', 1 },
                { 'logistic-science-pack', 1 },
            },
            time = 30,
        },
        order = 'c-c-a',
    },
})
