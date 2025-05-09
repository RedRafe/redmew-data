data:extend({
  -- Item Liquid Imersite
  {
    type = 'fluid',
    name = 'liquid-imersite',
    default_temperature = 25,
    heat_capacity = '0.1kJ',
    base_color = {r=1, g=0, b=1},
    flow_color = {r=1, g=0, b=1},
    order = 'ya01[liquid-imersite]',
    icon = '__redmew-data__/graphics/icons/liquid-imersite.png',
    icon_size = 64,
    icon_mipmaps = 4,
  },
  -- Recipe Liquid imersite
  {
    type = 'recipe',
    name = 'liquid-imersite',
    category = 'oil-processing',
    energy_required = 5,
    enabled = false,
    ingredients =
    {
      { type = 'item', name = 'copper-ore', amount = 15 },
      { type = 'item', name = 'stone', amount = 5 }
    },
    results=
    {
      { type = 'fluid', name = 'liquid-imersite', amount = 20 },
    },
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.995, b = 0.089, a = 1.000}, -- #fffd16ff
      secondary = {r = 1.000, g = 0.974, b = 0.691, a = 1.000}, -- #fff8b0ff
      tertiary = {r = 0.723, g = 0.638, b = 0.714, a = 1.000}, -- #b8a2b6ff
      quaternary = {r = 0.954, g = 1.000, b = 0.350, a = 1.000}, -- #f3ff59ff
    },
    group = 'intermediate-products',
    subgroup = 'fluid-recipes',
  },
  -- Raw Imersite
  {
    type = 'recipe',
    name = 'kr-imersite',
    always_show_made_in = true,
    category = 'chemistry',
    energy_required = 8,
    enabled = false,
    ingredients =
    {
      { type = 'fluid', name = 'liquid-imersite', amount = 10 },
    },
    results =
    {
      { type = 'item', name='kr-imersite', amount = 1 }

    },
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.995, b = 0.089, a = 1.000}, -- #fffd16ff
      secondary = {r = 1.000, g = 0.974, b = 0.691, a = 1.000}, -- #fff8b0ff
      tertiary = {r = 0.723, g = 0.638, b = 0.714, a = 1.000}, -- #b8a2b6ff
      quaternary = {r = 0.954, g = 1.000, b = 0.350, a = 1.000}, -- #f3ff59ff
    },
    allow_productivity = true,
  },
})

redmew.add_unlock('kr-quarry-minerals-extraction', 'liquid-imersite')
redmew.add_unlock('kr-quarry-minerals-extraction', 'kr-imersite')
