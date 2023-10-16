-- Raw rare metals
data:extend({
  {
    type = "recipe",
    name = "raw-rare-metals",
    always_show_made_in = true,
    category = "chemistry",
    energy_required = 3.2,
    enabled = true,
    ingredients =
    {
      { type = "item", name = "compact-raw-rare-metals", amount = 10 },
      { type = "fluid", name = "chlorine", amount = 8 },
    },
    results =
    {
      { type = "item", name = "raw-rare-metals", amount = 3 }

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

KDO.whitelist_productivity("raw-rare-metals")
