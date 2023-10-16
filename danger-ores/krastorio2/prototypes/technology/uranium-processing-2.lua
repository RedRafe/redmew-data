data:extend({
  -- Uranium Processing 2
  {
    type = "technology",
    name = "uranium-processing-2",
    localised_description = {"technology-description.uranium-processing-2"},
    icon_size = 256, icon_mipmaps = 1,
    icon = "__k2-danger-ores__/graphics/technology/uranium-processing-2.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "uranium-processing-2"
      }
    },
    prerequisites = {"uranium-processing", "concrete"},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 60,
      count = 200
    },
    order = "e-p-b-c"
  },
})

KDO.move_recipe_unlock("centrifuge", "uranium-processing", "uranium-processing-2")
KDO.move_recipe_unlock("uranium-fuel-cell", "uranium-processing", "uranium-processing-2")