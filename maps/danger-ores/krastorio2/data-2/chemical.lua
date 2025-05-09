local cp1 = redmew.config['chemical-plant']
local cp2 = redmew.config['chemical-plant-2']
local cp3 = redmew.config['kr-advanced-chemical-plant']
local or1 = redmew.config['oil-refinery']
local or2 = redmew.config['oil-refinery-2']
local or3 = redmew.config['oil-refinery-3']
local ep1 = redmew.config['kr-electrolysis-plant']
local ep2 = redmew.config['kr-electrolysis-plant-2']

--=================================================================================================

redmew.update_prototype(cp1)

--=================================================================================================

data:extend({
  -- Item
  {
    name = cp2.name,
    type = 'item',
    icons = {{
      icon = '__base__/graphics/icons/chemical-plant.png',
      tint = cp2._tint,
      icon_mipmaps = 4,
      icon_size = 64,
    }},
    order = 'e[chemical-plant]',
    place_result = cp2.name,
    stack_size = 10,
    subgroup = 'production-machine',
  },
  -- Recipe
  {
    name = cp2.name,
    type = 'recipe',
    enabled = false,
    energy_required = 5,
    ingredients = {
      { type = 'item', name = 'chemical-plant', amount = 2 },
      { type = 'item', name = 'engine-unit', amount = 10 },
      { type = 'item', name = 'processing-unit', amount = 5 },
      { type = 'item', name = 'pipe', amount = 50 },
      { type = 'item', name = 'copper-plate', amount = 100 },
    },
    results = {{ type = 'item', name = cp2.name, amount = 1 }},
  },
  -- Entity
  redmew.make_tier(cp2),
})

redmew.update_prototype(cp3)
redmew.add_ingredient(cp3.name, cp2.name, 2)

--=================================================================================================

redmew.update_prototype(or1)

--=================================================================================================

data:extend({
  -- Item
  {
    name = or2.name,
    type = 'item',
    icons = {{
      icon = '__base__/graphics/icons/oil-refinery.png',
      tint = or2._tint,
      icon_mipmaps = 4,
      icon_size = 64,
    }},
    order = 'd[refinery]',
    place_result = or2.name,
    stack_size = 10,
    subgroup = 'production-machine',
  },
  -- Recipe
  {
    name = or2.name,
    type = 'recipe',
    enabled = false,
    energy_required = 8,
    ingredients = {
      { type = 'item', name = 'oil-refinery', amount = 2 },
      { type = 'item', name = 'engine-unit', amount = 10 },
      { type = 'item', name = 'processing-unit', amount = 5 },
      { type = 'item', name = 'pipe-to-ground', amount = 10 },
      { type = 'item', name = 'copper-plate', amount = 40 },
      { type = 'item', name = 'refined-concrete', amount = 100 },
    },
    results = {{ type = 'item', name = or2.name, amount = 1 }},
  },
  -- Entity
  redmew.make_tier(or2),
})

--=================================================================================================

data:extend({
  -- Item
  {
    name = or3.name,
    type = 'item',
    icons = {{ 
      icon = '__base__/graphics/icons/oil-refinery.png', 
      tint = or3._tint,
      icon_mipmaps = 4,
      icon_size = 64,
    }},
    order = 'd[refinery]',
    place_result = or3.name,
    stack_size = 10,
    subgroup = 'production-machine',
  },
  -- Recipe
  {
    type = 'recipe',
    name = or3.name,
    enabled = false,
    energy_required = 8,
    ingredients = {
      { type = 'item', name = or2.name, amount = 2 },
      { type = 'item', name = 'processing-unit', amount = 20 },
      { type = 'item', name = 'kr-imersium-beam', amount = 20 },
      { type = 'item', name = 'kr-rare-metals', amount = 80 },
      { type = 'item', name = 'kr-energy-control-unit', amount = 10 },
      { type = 'item', name = 'kr-imersium-gear-wheel', amount = 20 },
      { type = 'item', name = 'kr-steel-pipe', amount = 10 },
    },
    results = {{ type = 'item', name = or3.name, amount = 1 }},
  },
  -- Entity
  redmew.make_tier(or3),
})

redmew.add_unlock(or3._technology, or3.name)

--=================================================================================================

redmew.update_prototype(ep1)

--=================================================================================================

data:extend({
  -- Item
  {
    name = ep2.name,
    type = 'item',
    icons = {{
      icon = '__Krastorio2Assets__/icons/entities/electrolysis-plant.png',
      tint = ep2._tint,
      icon_mipmaps = 4,
      icon_size = 64,
    }},
    order = 'e-a1[electrolysis-plant]',
    place_result = ep2.name,
    stack_size = 50,
    subgroup = 'production-machine',
  },
  -- Recipe
  {
    name = ep2.name,
    type = 'recipe',
    enabled = false,
    energy_required = 8,
    ingredients = {
      { type = 'item', name = 'kr-electrolysis-plant', amount = 4 },
      { type = 'item', name = 'kr-glass', amount = 120 },
      { type = 'item', name = 'processing-unit', amount = 20 },
      { type = 'item', name = 'kr-rare-metals', amount = 80 },
      { type = 'item', name = 'kr-imersium-gear-wheel', amount = 20 },
      { type = 'item', name = 'kr-steel-pipe', amount = 20 },
    },
    results = {{ type = 'item', name = ep2.name, amount = 1 }},
  },
  -- Entity
  redmew.make_tier(ep2),
})

redmew.add_unlock(ep2._technology, ep2.name)

--=================================================================================================

data:extend({{
  type = 'technology',
  name = 'oil-processing-2',
  icons = {{
    icon = '__base__/graphics/technology/oil-gathering.png',
    tint = cp2._tint,
    icon_size = 256,
    icon_mipmaps = 4,
  }},
  prerequisites = {'oil-processing', 'production-science-pack'},
  effects = {
    {type = 'unlock-recipe', recipe = cp2.name},
    {type = 'unlock-recipe', recipe = or2.name},
  },
  unit = {
    count = 400,
    ingredients = {
      { 'automation-science-pack', 1 },
      { 'logistic-science-pack', 1 },
      { 'chemical-science-pack', 1 },
      { 'production-science-pack', 1 },
    },
    time = 60
  },
  order = 'd-a'
}})

redmew.add_prerequisite('kr-advanced-chemical-plant', 'oil-processing-2')
