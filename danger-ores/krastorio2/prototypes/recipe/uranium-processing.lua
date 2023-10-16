data:extend({
  -- Uranium processing
  {
    type = "recipe",
    name = "uranium-processing",
    always_show_made_in = true,
    energy_required = 8,
    enabled = false,
    category = "chemistry",
    ingredients =
    {
      { type = "item", name = "uranium-ore", amount = 10 },
      { type = "fluid", name = "sulfuric-acid", amount = 5 }
    },
    icon = "__k2-danger-ores__/graphics/icons/uranium-powder.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "k[uranium-processing-1]",
    results =
    {
      { name = "yellowcake", amount = 2 },
      { name = "stone", amount = 5 },
      { name = "iron-ore", amount = 3 }
    },
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.642, b = 0.261, a = 1.000}, -- #ffa342ff
      secondary = {r = 1.000, g = 0.722, b = 0.376, a = 1.000}, -- #ffb85fff
      tertiary = {r = 0.854, g = 0.659, b = 0.576, a = 1.000}, -- #d9a892ff
      quaternary = {r = 1.000, g = 0.494, b = 0.271, a = 1.000}, -- #ff7e45ff
    }
  },
})

KDO.whitelist_productivity("uranium-processing")
