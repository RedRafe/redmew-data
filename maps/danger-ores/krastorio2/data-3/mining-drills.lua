-- Mk.1 > T2 > Mk.2 > T3 > Mk.3 

local emd1 = redmew.config['electric-mining-drill']
local emd2 = redmew.config['electric-mining-drill-2']
local emd3 = redmew.config['kr-electric-mining-drill-mk2']
local emd4 = redmew.config['electric-mining-drill-3']
local emd5 = redmew.config['kr-electric-mining-drill-mk3']

--=================================================================================================

redmew.update_prototype(emd1)

--=================================================================================================

data:extend({
  -- Item
  {
    name = emd2.name,
    type = 'item',
    icons = {{
      icon = '__Krastorio2Assets__/icons/entities/electric-mining-drill.png',
      tint = emd2._tint,
      icon_size = 64,
    }},
    order = 'a[items]-b[electric-mining-drill]',
    place_result = emd2.name,
    stack_size = 50,
    subgroup = 'extraction-machine',
  },
  -- Recipe
  {
    name = emd2.name,
    type = 'recipe',
    enabled = false,
    energy_required = 2,
    ingredients = {
      { type = 'item', name = 'electric-mining-drill', amount = 2 },
      { type = 'item', name = 'steel-plate', amount = 5 },
      { type = 'item', name = 'advanced-circuit', amount = 2 },
      { type = 'item', name = 'copper-plate', amount = 10 },
    },
    results = {{ type = 'item', name = emd2.name, amount = 1 }},
  },
  -- Entity
  redmew.make_tier(emd2),
  -- Technology
  {
    type = 'technology',
    name = emd2.name,
    icons = {{
      icon = '__Krastorio2Assets__/technologies/electric-mining-drill.png',
      tint = emd2._tint,
      icon_size = 256,
      icon_mipmaps = 4,
    }},
    effects = {{type = 'unlock-recipe', recipe = emd2.name}},
    prerequisites = {'electric-mining-drill', 'chemical-science-pack'},
    unit = {
      count = 250,
      ingredients = {
        { 'automation-science-pack', 1 },
        { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 }
      },
      time = 30
    },
    order = 'c-c-b'
  }
})

--=================================================================================================

redmew.update_prototype(emd3)
redmew.replace_ingredient(emd3.name, emd1.name, emd2.name, 2)
redmew.replace_prerequisite(emd3._technology, emd1._technology, emd2.name)
redmew.replace_prerequisite(emd3._technology, 'engine', 'production-science-pack')
redmew.add_research_ingredient(emd3._technology, 'production-science-pack')

--=================================================================================================

data:extend({
  -- Item
  {
    name = emd4.name,
    type = 'item',
    icons = {{
      icon = '__Krastorio2Assets__/icons/entities/electric-mining-drill.png',
      tint = emd4._tint,
      icon_size = 64,
    }},
    order = 'a[items]-c[electric-mining-drill-mk2]-2',
    place_result = emd4.name,
    stack_size = 50,
    subgroup = 'extraction-machine',
  },
  -- Recipe
  {
    name = emd4.name,
    type = 'recipe',
    enabled = false,
    energy_required = 2,
    ingredients = {
      { type = 'item', name = 'kr-electric-mining-drill-mk2', amount = 1 },
      { type = 'item', name = 'electric-engine-unit', amount = 10 },
      { type = 'item', name = 'processing-unit', amount = 5 },
      { type = 'item', name = 'low-density-structure', amount = 2 },
    },
    results = {{ type = 'item', name = emd4.name, amount = 1 }},
  },
  -- Entity
  redmew.make_tier(emd4),
  -- Technology
  {
    type = 'technology',
    name = emd4.name,
    icons = {{
      icon = '__Krastorio2Assets__/technologies/electric-mining-drill.png',
      tint = emd4._tint,
      icon_size = 256,
      icon_mipmaps = 4,
    }},
    effects = {{ type = 'unlock-recipe', recipe = emd4.name }},
    prerequisites = { emd3.name, 'production-science-pack', 'utility-science-pack' },
    unit = {
      count = 300,
      ingredients = {
        { 'automation-science-pack', 1 },
        { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 },
        { 'production-science-pack', 1 },
        { 'utility-science-pack', 1 }
      },
      time = 60
    },
    order = 'a-b-c'
  }
})

--=================================================================================================

redmew.update_prototype(emd5)
redmew.replace_ingredient(emd5.name, emd3.name, emd4.name, 2)
redmew.replace_prerequisite(emd5._technology, emd3.name, emd4.name)
redmew.replace_prerequisite(emd5._technology,  'kr-imersium-processing' , 'kr-advanced-tech-card')
