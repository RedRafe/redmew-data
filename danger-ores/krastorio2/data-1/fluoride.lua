data:extend({
  -- Item
  {
    type = "item",
    name = "fluoride",
    icon = "__redmew-data__/graphics/icons/fluoride.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "g[thorium-fluoride]",
    stack_size = 50
  },
  -- Recipe
  {
    type = "recipe",
    name = "fluoride",
    always_show_made_in = true,
    category = "chemistry",
    energy_required = 8,
    enabled = false,
    ingredients =
    {
      { type = "fluid", name = "water", amount = 800 },
      { type = "item", name = "stone", amount = 30 },
      { type = "item", name = "iron-plate", amount = 5 },
    },
    results =
    {
      { type = "item", name = "fluoride", amount = 1 },
      { type = "fluid", name = "water", amount = 200 },
    },
    main_product = "fluoride",
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.995, b = 0.089, a = 1.000}, -- #fffd16ff
      secondary = {r = 1.000, g = 0.974, b = 0.691, a = 1.000}, -- #fff8b0ff
      tertiary = {r = 0.723, g = 0.638, b = 0.714, a = 1.000}, -- #b8a2b6ff
      quaternary = {r = 0.954, g = 1.000, b = 0.350, a = 1.000}, -- #f3ff59ff
    }
  },
  -- Technology
  {
    type = "technology",
    name = "fluoride-processing",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__redmew-data__/graphics/technology/fluoride-processing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "fluoride"
      },
      {
        type = "unlock-recipe",
        recipe = "mineral-water"
      }
    },
    prerequisites = { "chemical-science-pack" },
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30,
      count = 150
    },
    order = "e-p-b-c"
  },
})

redmew.whitelist_productivity("fluoride")
