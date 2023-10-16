if not settings.startup['k2-danger-ores:tiered_entities'].value then return end

--=================================================================================================

local bo1 = KDO.config["boiler"]
local bo2 = KDO.config["boiler-2"]
local se1 = KDO.config["steam-engine"]
local se2 = KDO.config["steam-engine-2"]

--=================================================================================================

KDO.update_protytype(bo1)

--=================================================================================================

data:extend({
  -- Item
  {
    name = bo2.name,
    type = "item",
    icon = "__base__/graphics/icons/boiler.png",
    icon_mipmaps = 4,
    icon_size = 64,
    icons = {{
      icon = "__base__/graphics/icons/boiler.png",
      tint = bo2._tint
    }},
    order = "b[steam-power]-a[boiler]",
    place_result = bo2.name,
    stack_size = 50,
    subgroup = "energy",
  },
  -- Recipe
  {
    name = bo2.name,
    type = "recipe",
    enabled = false,
    energy_required = 0.5,
    ingredients = {
      { "boiler", 3 },
      { "steel-furnace", 3 },
      { "copper-plate", 20 }
    },
    result = bo2.name,
  },
  -- Entity
  KDO.make_tier(bo2),
})

--=================================================================================================

KDO.update_protytype(se1)

--=================================================================================================

data:extend({
  -- Item
  {
    name = se2.name,
    type = "item",
    icon = "__base__/graphics/icons/steam-engine.png",
    icon_mipmaps = 4,
    icon_size = 64,
    icons = {{
      icon = "__base__/graphics/icons/steam-engine.png",
      tint = se2._tint
    }},
    order = "b[steam-power]-b[steam-engine]",
    place_result = se2.name,
    stack_size = 10,
    subgroup = "energy",
  },
  -- Recipe
  {
    name = se2.name,
    type = "recipe",
    enabled = false,
    energy_required = 0.5,
    ingredients = {
      { "steam-engine", 2 },
      { "engine-unit", 5 },
      { "steel-plate", 10 },
      { "pipe", 25 },
      { "copper-plate", 80 }
    },
    result = se2.name,
  },
  -- Entity
  KDO.make_tier(se2),
})

--=================================================================================================

data:extend({{
  type = "technology",
  name = "steam-engine-2",
  icon_size = 256,
  icon_mipmaps = 4,
  icon = "__Krastorio2Assets__/technologies/steam-engine.png",
  icons = {{
    icon = "__Krastorio2Assets__/technologies/steam-engine.png",
    tint = se2._tint
  }},
  prerequisites = {"chemical-science-pack"},
  effects = {
    {type = "unlock-recipe", recipe = bo2.name},
    {type = "unlock-recipe", recipe = se2.name},
  },
  unit = {
    count = 350,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1}
    },
    time = 30
  },
  order = "d-a"
}})
