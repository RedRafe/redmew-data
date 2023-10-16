data:extend({
  -- Yellowcake processing
  {
    type = "recipe",
    name = "uranium-processing-2",
    always_show_made_in = true,
    energy_required = 30,
    enabled = false,
    category = "centrifuging",
    ingredients = {{"yellowcake", 3}},
    icon = "__base__/graphics/icons/uranium-processing.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "r[uranium-processing]-b3",
    results =
    {
      {
        name = "uranium-235",
        probability = 0.007,
        amount = 1
      },
      {
        name = "uranium-238",
        probability = 0.993,
        amount = 1
      }
    }
  },
})

KDO.whitelist_productivity("uranium-processing-2")
