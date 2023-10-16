if not settings.startup['k2-danger-ores:tiered_entities'].value then return end

--=================================================================================================

-- Mk.1 > T2 > Mk.2 > T3 > Mk.3 

local emd1 = KDO.config["electric-mining-drill"]
local emd2 = KDO.config["electric-mining-drill-2"]
local emd3 = KDO.config["kr-electric-mining-drill-mk2"]
local emd4 = KDO.config["electric-mining-drill-3"]
local emd5 = KDO.config["kr-electric-mining-drill-mk3"]

--=================================================================================================

KDO.update_protytype(emd1)

--=================================================================================================

data:extend({
  -- Item
  {
    name = emd2.name,
    type = "item",
    icon = "__Krastorio2Assets__/icons/entities/electric-mining-drill.png",
    icon_size = 64,
    icons = {
      {
        icon = "__Krastorio2Assets__/icons/entities/electric-mining-drill.png",
        tint = emd2._tint
      }
    },
    order = "a[items]-b[electric-mining-drill]",
    place_result = emd2.name,
    stack_size = 50,
    subgroup = "extraction-machine",
  },
  -- Recipe
  {
    name = emd2.name,
    type = "recipe",
    enabled = false,
    energy_required = 2,
    ingredients = {
      { "electric-mining-drill", 2 },
      { "steel-plate", 5 },
      { "advanced-circuit", 2 },
      { "copper-plate", 10 },
    },
    result = emd2.name,
  },
  -- Entity
  KDO.make_tier(emd2),
  -- Technology
  {
    type = "technology",
    name = emd2.name,
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    icon_size = 256,
    icon_mipmaps = 4,
    icons = {{
      icon = "__Krastorio2Assets__/technologies/electric-mining-drill.png",
      tint = emd2._tint
    }},
    effects = {{type = "unlock-recipe", recipe = emd2.name}},
    prerequisites = {"kr-electric-mining-drill", "chemical-science-pack"},
    unit = {
      count = 250,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    order = "c-c-b"
  }
})

--=================================================================================================

KDO.update_protytype(emd3)
KDO.replace_ingredient(emd3.name, emd1.name, emd2.name, 2)
KDO.replace_prerequisite(emd3._technology, emd1._technology, emd2.name)
KDO.replace_prerequisite(emd3._technology, "engine", "production-science-pack")
KDO.add_research_ingredient(emd3._technology, "production-science-pack")

--=================================================================================================

data:extend({
  -- Item
  {
    name = emd4.name,
    type = "item",
    icon = "__Krastorio2Assets__/icons/entities/electric-mining-drill.png",
    icon_size = 64,
    icons = {
      {
        icon = "__Krastorio2Assets__/icons/entities/electric-mining-drill.png",
        tint = emd4._tint
      }
    },
    order = "a[items]-c[electric-mining-drill]",
    place_result = emd4.name,
    stack_size = 50,
    subgroup = "extraction-machine",
  },
  -- Recipe
  {
    name = emd4.name,
    type = "recipe",
    enabled = false,
    energy_required = 2,
    ingredients = {
      { "kr-electric-mining-drill-mk2", 1 },
      { "electric-engine-unit", 10 },
      { "processing-unit", 5 },
      { "low-density-structure", 2 },
    },
    result = emd4.name,
  },
  -- Entity
  KDO.make_tier(emd4),
  -- Technology
  {
    type = "technology",
    name = emd4.name,
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    icon_size = 256,
    icon_mipmaps = 4,
    icons = {{
      icon = "__Krastorio2Assets__/technologies/electric-mining-drill.png",
      tint = emd4._tint
    }},
    effects = {{type = "unlock-recipe", recipe = emd4.name}},
    prerequisites = {emd3.name, "production-science-pack", "utility-science-pack"},
    unit = {
      count = 300,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    order = "a-b-c"
  }
})

--=================================================================================================

KDO.update_protytype(emd5)
KDO.replace_ingredient(emd5.name, emd3.name, emd4.name, 2)
KDO.replace_prerequisite(emd5._technology, emd3.name, emd4.name)
KDO.replace_prerequisite(emd5._technology,  "kr-imersium-processing" , "kr-advanced-tech-card")
