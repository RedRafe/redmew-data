local emd1 = redmew.config['electric-mining-drill']
local emd2 = redmew.config['electric-mining-drill-2']
local emd3 = redmew.config['electric-mining-drill-3']

--=================================================================================================

redmew.update_prototype(emd1)

--=================================================================================================

data:extend({
  -- Item
  {
    name = emd2.name,
    type = 'item',
    icon = '__base__/graphics/icons/electric-mining-drill.png',
    icon_size = 64,
    icons = {
      {
        icon = '__base__/graphics/icons/electric-mining-drill.png',
        tint = emd2._tint
      }
    },
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
    ingredients = emd2._ingredients or {
      { type = 'item', name = 'electric-mining-drill', amount = 2 },
      { type = 'item', name = 'steel-plate', amount = 5 },
      { type = 'item', name = 'advanced-circuit', amount = 3 },
    },
    results = {{ type = 'item', name = emd2.name, amount = 1 }},
  },
  -- Entity
  redmew.make_tier(emd2),
  -- Technology
  {
    type = 'technology',
    name = emd2.name,
    icon = '__base__/graphics/technology/mining-productivity.png',
    icon_size = 256,
    icon_mipmaps = 4,
    icons = {{
      icon = '__base__/graphics/technology/mining-productivity.png',
      tint = emd2._tint
    }},
    effects = {{ type = 'unlock-recipe', recipe = emd2.name }},
    prerequisites = emd2._prerequisites or {
      'advanced-material-processing',
      'chemical-science-pack'
    },
    unit = emd2._unit or {
      count = 250,
      ingredients = {
        { 'automation-science-pack', 1 },
        { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 },
      },
      time = 30
    },
    order = 'c-c-b'
  }
})

--=================================================================================================

data:extend({
  -- Item
  {
    name = emd3.name,
    type = 'item',
    icon = '__base__/graphics/icons/electric-mining-drill.png',
    icon_size = 64,
    icons = {
      {
        icon = '__base__/graphics/icons/electric-mining-drill.png',
        tint = emd3._tint
      }
    },
    order = 'a[items]-c[electric-mining-drill]',
    place_result = emd3.name,
    stack_size = 50,
    subgroup = 'extraction-machine',
  },
  -- Recipe
  {
    name = emd3.name,
    type = 'recipe',
    enabled = false,
    energy_required = 2,
    ingredients = emd3._ingredients or {
      { type = 'item', name = 'electric-mining-drill-2', amount = 2 },
      { type = 'item', name = 'engine-unit', amount = 10 },
      { type = 'item', name = 'processing-unit', amount = 5 },
    },
    results = {{ type = 'item', name = emd3.name, amount = 1 }},
  },
  -- Entity
  redmew.make_tier(emd3),
  -- Technology
  {
    type = 'technology',
    name = emd3.name,
    icon = '__base__/graphics/technology/mining-productivity.png',
    icon_size = 256,
    icon_mipmaps = 4,
    icons = {{
      icon = '__base__/graphics/technology/mining-productivity.png',
      tint = emd3._tint
    }},
    effects = {{ type = 'unlock-recipe', recipe = emd3.name }},
    prerequisites = emd3._prerequisites or { 
      'electric-mining-drill-2',
      'production-science-pack',
      'utility-science-pack'
    },
    unit = emd3._unit or {
      count = 300,
      ingredients = {
        { 'automation-science-pack', 1 },
        { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 },
        { 'production-science-pack', 1 },
        { 'utility-science-pack', 1 },
      },
      time = 60
    },
    order = 'a-b-c'
  }
})
