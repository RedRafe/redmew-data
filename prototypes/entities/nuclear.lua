local nr1 = redmew.config['nuclear-reactor']
local nr2 = redmew.config['nuclear-reactor-2']
local he1 = redmew.config['heat-exchanger']
local he2 = redmew.config['heat-exchanger-2']
local st1 = redmew.config['steam-turbine']
local st2 = redmew.config['steam-turbine-2']

--=================================================================================================

redmew.update_prototype(nr1)

--=================================================================================================

data:extend({
    -- Item
    {
        name = nr2.name,
        type = 'item',
        icons = redmew.reskin_library.make_item_icons('nuclear-reactor', nr2._tint),
        order = 'f[nuclear-energy]-a[reactor]',
        place_result = nr2.name,
        stack_size = 1,
        subgroup = 'energy',
    },
    -- Recipe
    {
        name = nr2.name,
        type = 'recipe',
        enabled = false,
        energy_required = 8,
        ingredients = {
            { type = 'item', name = 'nuclear-reactor', amount = 4 },
            { type = 'item', name = 'low-density-structure', amount = 100 },
            { type = 'item', name = 'processing-unit', amount = 100 },
            { type = 'item', name = 'refined-concrete', amount = 1000 },
            { type = 'item', name = 'heat-pipe', amount = 100 },
        },
        results = { { type = 'item', name = nr2.name, amount = 1 } },
    },
    -- Entity
    redmew.make_tier(nr2),
})

--=================================================================================================

redmew.update_prototype(he1)

--=================================================================================================

data:extend({
    -- Item
    {
        name = he2.name,
        type = 'item',
        icons = redmew.reskin_library.make_item_icons('heat-exchanger', he2._tint),
        order = 'f[nuclear-energy]-c[heat-exchanger]',
        place_result = he2.name,
        stack_size = 50,
        subgroup = 'energy',
    },
    -- Recipe
    {
        name = he2.name,
        type = 'recipe',
        enabled = false,
        energy_required = 3,
        ingredients = {
            { type = 'item', name = 'heat-exchanger', amount = 2 },
            { type = 'item', name = 'low-density-structure', amount = 10 },
            { type = 'item', name = 'heat-pipe', amount = 10 },
        },
        results = { { type = 'item', name = he2.name, amount = 1 } },
    },
    -- Entity
    redmew.make_tier(he2),
})

--=================================================================================================

redmew.update_prototype(st1)

--=================================================================================================

data:extend({
    -- Item
    {
        name = st2.name,
        type = 'item',
        icons = redmew.reskin_library.make_item_icons('steam-turbine', st2._tint),
        order = 'f[nuclear-energy]-d[steam-turbine]',
        place_result = st2.name,
        stack_size = 10,
        subgroup = 'energy',
    },
    -- Recipe
    {
        type = 'recipe',
        name = st2.name,
        enabled = false,
        energy_required = 3,
        ingredients = {
            { type = 'item', name = 'steam-turbine', amount = 2 },
            { type = 'item', name = 'low-density-structure', amount = 25 },
            { type = 'item', name = 'processing-unit', amount = 25 },
            { type = 'item', name = 'heat-pipe', amount = 15 },
        },
        results = { { type = 'item', name = st2.name, amount = 1 } },
    },
    -- Entity
    redmew.make_tier(st2),
})

--=================================================================================================

data.raw['heat-pipe']['heat-pipe'].heat_buffer.max_temperature = nr2.heat_buffer.max_temperature

data:extend({
    {
        type = 'technology',
        name = 'nuclear-power-2',
        icons = redmew.reskin_library.make_technology_icons('nuclear-power', nr2._tint),
        prerequisites = { 'nuclear-power', 'production-science-pack', 'utility-science-pack' },
        effects = {
            { type = 'unlock-recipe', recipe = st2.name },
            { type = 'unlock-recipe', recipe = nr2.name },
            { type = 'unlock-recipe', recipe = he2.name },
        },
        unit = {
            count = 400,
            ingredients = {
                { 'automation-science-pack', 1 },
                { 'logistic-science-pack', 1 },
                { 'chemical-science-pack', 1 },
                { 'production-science-pack', 1 },
                { 'utility-science-pack', 1 },
            },
            time = 30,
        },
        order = 'd-a',
    },
})
