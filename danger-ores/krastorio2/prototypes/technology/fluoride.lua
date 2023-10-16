data:extend({
  -- Fluoride
  {
    type = "technology",
    name = "fluoride-processing",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__k2-danger-ores__/graphics/technology/fluoride-processing.png",
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
    prerequisites = {"chemical-science-pack"},
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