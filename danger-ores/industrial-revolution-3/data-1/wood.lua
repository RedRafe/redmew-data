data:extend({
  {
    type = "recipe",
    name = "do:rubber-wood",
    localised_name = "Constant rubber wood",
    category = "forestry",
    subgroup = "wood",
    order = "0000",
    hidden = false,
    allow_decomposition = false,
    show_amount_in_title = false,
    always_show_products = true,
    enabled = true,
    ingredients = {
      { name = "water", amount = 30, type = "fluid" }
    },
    results = {
      { name = "rubber-wood", amount = 1, type = "item", probability = 0.5 }
    },
    energy_required = 12,
    icons = {
      { 
        icon =  "__IndustrialRevolution3Assets1__/graphics/icons/64/forestry-rubber-wood-2.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
    },
    emissions_multiplier = 1,
    IR_tech_rebuild_ignore = true,
  },
  {
    type = "recipe",
    name = "do:wood",
    localised_name = "Constant wood",
    category = "forestry",
    subgroup = "wood",
    order = "0000",
    hidden = false,
    allow_decomposition = false,
    show_amount_in_title = false,
    always_show_products = true,
    enabled = true,
    ingredients = {
      { name = "water", amount = 30, type = "fluid" }
    },
    results = {
      { name = "wood", amount = 1, type = "item", probability = 0.5  }
    },
    energy_required = 12,
    icons = {
      { 
        icon =  "__IndustrialRevolution3Assets1__/graphics/icons/64/forestry-wood-2.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
    },
    emissions_multiplier = 1,
    IR_tech_rebuild_ignore = true,
  },
  {
    type = "recipe",
    name = "do:rubber-wood-fertiliser",
    localised_name = "Constant rubber wood fertiliser",
    category = "forestry-advanced",
    subgroup = "wood",
    order = "0000",
    hidden = false,
    allow_decomposition = false,
    show_amount_in_title = false,
    always_show_products = true,
    enabled = true,
    ingredients = {
      { name = "liquid-fertiliser", amount = 30, type = "fluid" },
      { name = "carbon-gas", amount = 15, type = "fluid" }
    },
    results = {
      { name = "oxygen-gas", amount = 15, type = "fluid" },
      { name = "rubber-wood", amount = 1, type = "item" }
    },
    energy_required = 6,
    icons = {
      { 
        icon =  "__IndustrialRevolution3Assets1__/graphics/icons/64/forestry-rubber-wood-2.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
    },
    emissions_multiplier = 1,
    IR_tech_rebuild_ignore = true,
  },
  {
    type = "recipe",
    name = "do:wood-fertiliser",
    localised_name = "Constant wood fertiliser",
    category = "forestry-advanced",
    subgroup = "wood",
    order = "0000",
    hidden = false,
    allow_decomposition = false,
    show_amount_in_title = false,
    always_show_products = true,
    enabled = true,
    ingredients = {
      { name = "liquid-fertiliser", amount = 30, type = "fluid" },
      { name = "carbon-gas", amount = 15, type = "fluid" }
    },
    results = {
      { name = "oxygen-gas", amount = 15, type = "fluid" },
      { name = "wood", amount = 1, type = "item" }
    },
    energy_required = 6,
    icons = {
      { 
        icon =  "__IndustrialRevolution3Assets1__/graphics/icons/64/forestry-wood-2.png",
        icon_size = 64,
        icon_mipmaps = 4
      },
    },
    emissions_multiplier = 1,
    IR_tech_rebuild_ignore = true,
  }
})