local cp1 = redmew.config["chemical-plant"]
local cp2 = redmew.config["chemical-plant-2"]
local or1 = redmew.config["oil-refinery"]
local or2 = redmew.config["oil-refinery-2"]

--=================================================================================================

redmew.update_prototype(cp1)

--=================================================================================================

data:extend({
  -- Item
  {
    name = cp2.name,
    type = "item",
    icon = "__base__/graphics/icons/chemical-plant.png",
    icon_mipmaps = 4,
    icon_size = 64,
    icons = {{
      icon = "__base__/graphics/icons/chemical-plant.png",
      tint = cp2._tint
    }},
    order = "e[chemical-plant]",
    place_result = cp2.name,
    stack_size = 10,
    subgroup = "production-machine",
  },
  -- Recipe
  {
    name = cp2.name,
    type = "recipe",
    enabled = false,
    energy_required = 5,
    ingredients = {
      { "chemical-plant", 2 },
      { "engine-unit", 10 },
      { "processing-unit", 5 },
      { "pipe", 50 }
    },
    result = cp2.name,
  },
  -- Entity
  redmew.make_tier(cp2),
})

--=================================================================================================

redmew.update_prototype(or1)

--=================================================================================================

data:extend({
  -- Item
  {
    name = or2.name,
    type = "item",
    icon = "__base__/graphics/icons/oil-refinery.png",
    icon_mipmaps = 4,
    icon_size = 64,
    icons = {{
      icon = "__base__/graphics/icons/oil-refinery.png",
      tint = or2._tint
    }},
    order = "d[refinery]",
    place_result = or2.name,
    stack_size = 10,
    subgroup = "production-machine",
  },
  -- Recipe
  {
    name = or2.name,
    type = "recipe",
    enabled = false,
    energy_required = 8,
    ingredients = {
      { "oil-refinery", 2 },
      { "engine-unit", 10 },
      { "processing-unit", 5 },
      { "pipe-to-ground", 10 },
      { "refined-concrete", 100 }
  },
    result = or2.name,
  },
  -- Entity
  redmew.make_tier(or2),
})

--=================================================================================================

data:extend({
  {
    type = "technology",
    name = "oil-processing-2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = "__base__/graphics/technology/oil-gathering.png",
    icons = {{
      icon = "__base__/graphics/technology/oil-gathering.png",
      tint = cp2._tint
    }},
    prerequisites = { "oil-processing", "production-science-pack" },
    effects = {
      { type = "unlock-recipe", recipe = cp2.name },
      { type = "unlock-recipe", recipe = or2.name },
    },
    unit = {
      count = 400,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 }
      },
      time = 60
    },
    order = "d-a"
  }
})
