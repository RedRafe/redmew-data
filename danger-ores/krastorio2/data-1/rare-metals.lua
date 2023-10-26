data:extend({
  -- Compact raw rare metals
  {
    type = 'item',
    name = 'compact-raw-rare-metals',
    icon = '__redmew-data__/graphics/icons/cluster-rare.png',
    icon_size = 64,
    icon_mipmaps = 4,
    pictures =
    {
      { size = 64, filename = '__redmew-data__/graphics/icons/rare-1.png', scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = '__redmew-data__/graphics/icons/rare-2.png', scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = '__redmew-data__/graphics/icons/rare-3.png', scale = 0.25, mipmap_count = 4 },
    },
    subgroup = 'raw-material',
    order = 'ga[compact-raw-rare-metals]',
    stack_size = 200
  },
  -- Recipe Raw rare metals
  {
    type = 'recipe',
    name = 'raw-rare-metals',
    always_show_made_in = true,
    category = 'chemistry',
    energy_required = 3.2,
    enabled = true,
    ingredients =
    {
      { type = 'item', name = 'compact-raw-rare-metals', amount = 10 },
      { type = 'fluid', name = 'chlorine', amount = 8 },
    },
    results =
    {
      { type = 'item', name = 'raw-rare-metals', amount = 3 }

    },
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.995, b = 0.089, a = 1.000}, -- #fffd16ff
      secondary = {r = 1.000, g = 0.974, b = 0.691, a = 1.000}, -- #fff8b0ff
      tertiary = {r = 0.723, g = 0.638, b = 0.714, a = 1.000}, -- #b8a2b6ff
      quaternary = {r = 0.954, g = 1.000, b = 0.350, a = 1.000}, -- #f3ff59ff
    }
  },
})

redmew.whitelist_productivity('raw-rare-metals')

data.raw.resource['rare-metals'].minable =
{
  mining_particle = 'stone-particle',
  mining_time = 1,
  result = 'compact-raw-rare-metals'
}