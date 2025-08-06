local coal_liquefaction = data.raw.recipe['coal-liquefaction']
if coal_liquefaction then
    coal_liquefaction.enabled = false
    coal_liquefaction.ingredients = {
        { type = 'item',  name = 'coal',  amount = 10 },
        { type = 'fluid', name = 'steam', amount = 50 },
    }
    coal_liquefaction.results = {
        { type = 'fluid', name = 'heavy-oil',     amount = 65 },
        { type = 'fluid', name = 'light-oil',     amount = 20 },
        { type = 'fluid', name = 'petroleum-gas', amount = 10 },
    }
end

data:extend({
    {
        type = 'recipe',
        name = 'advanced-coal-liquefaction',
        category = 'oil-processing',
        enabled = false,
        energy_required = 5,
        ingredients = {
            { type = 'item',  name = 'coal',  amount =  10 },
            { type = 'fluid', name = 'water', amount = 100 },
            { type = 'fluid', name = 'steam', amount =  50 },
        },
        results = {
            { type = 'fluid', name = 'heavy-oil',     amount = 90 },
            { type = 'fluid', name = 'light-oil',     amount = 20 },
            { type = 'fluid', name = 'petroleum-gas', amount = 40 },
        },
        allow_productivity = true,
        icon = '__redmew-data__/graphics/icons/adv-coal-liquefaction.png',
        subgroup = 'fluid-recipes',
        order = 'a[oil-processing]-d[coal-liquefaction]',
        allow_decomposition = false,
    },
})

local oil_processing = data.raw.technology['advanced-oil-processing']
if oil_processing then
    oil_processing.unit.count = 25
end

redmew.move_recipe_unlock('solid-fuel-from-heavy-oil', 'advanced-oil-processing', 'oil-processing')
redmew.move_recipe_unlock('solid-fuel-from-light-oil', 'advanced-oil-processing', 'oil-processing')
redmew.move_recipe_unlock('coal-liquefaction',         'coal-liquefaction',       'oil-processing')
redmew.add_unlock('coal-liquefaction', 'advanced-coal-liquefaction')
