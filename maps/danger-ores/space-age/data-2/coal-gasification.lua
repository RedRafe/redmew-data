data:extend({
    {
        type = 'recipe',
        name = 'coal-gasification',
        always_show_made_in = true,
        ingredients = {
            { type = 'item', name = 'coal', amount = 20 },
            { type = 'fluid', name = 'steam', amount = 50 },
        },
        results = { { type = 'fluid', name = 'ammoniacal-solution', amount = 70 } },
        enabled = false,
        energy_required = 5,
        category = 'chemistry-or-cryogenics',
        subgroup = 'fluid-recipes',
        order = 'd[other-chemistry]-d[coal-gasification]',
        icon_size = 64,
        allow_productivity = true,
    },
})

redmew.add_unlock('solar-system-edge-discovery', 'coal-gasification')
