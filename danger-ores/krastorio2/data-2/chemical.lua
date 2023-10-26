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
    icon = '__base__/graphics/icons/chemical-plant.png',
    icon_mipmaps = 4,
    icon_size = 64,
    icons = {{
      icon = '__base__/graphics/icons/chemical-plant.png',
      tint = cp2._tint
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
      { 'chemical-plant', 2 },
      { 'engine-unit', 10 },
      { 'processing-unit', 5 },
      { 'pipe', 50 },
      { 'copper-plate', 100 }
    },
    result = cp2.name,
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
    icon = '__base__/graphics/icons/oil-refinery.png',
    icon_mipmaps = 4,
    icon_size = 64,
    icons = {{
      icon = '__base__/graphics/icons/oil-refinery.png',
      tint = or2._tint
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
      { 'oil-refinery', 2 },
      { 'engine-unit', 10 },
      { 'processing-unit', 5 },
      { 'pipe-to-ground', 10 },
      { 'copper-plate', 40 },
      { 'refined-concrete', 100 }
    },
    result = or2.name,
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
    icon = '__base__/graphics/icons/oil-refinery.png',
    icon_mipmaps = 4,
    icon_size = 64,
    icons = {{ 
      icon = '__base__/graphics/icons/oil-refinery.png', 
      tint = or3._tint
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
      { or2.name, 2 },
      { 'processing-unit', 20 },
      { 'imersium-beam', 20 },
      { 'rare-metals', 80 },
      { 'energy-control-unit', 10 },
      { 'imersium-gear-wheel', 20 },
      { 'kr-steel-pipe', 10 },
    },
    result = or3.name,
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
    icon = '__Krastorio2Assets__/icons/entities/electrolysis-plant.png',
    icon_mipmaps = 4,
    icon_size = 64,
    icons = {{
      icon = '__Krastorio2Assets__/icons/entities/electrolysis-plant.png',
      tint = ep2._tint
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
      { 'kr-electrolysis-plant', 4 },
      { 'glass', 120 },
      { 'processing-unit', 20 },
      { 'rare-metals', 80 },
      { 'imersium-gear-wheel', 20 },
      { 'kr-steel-pipe', 20 },
    },
    result = ep2.name,
  },
  -- Entity
  redmew.make_tier(ep2),
})

redmew.add_unlock(ep2._technology, ep2.name)

--=================================================================================================

data:extend({{
  type = 'technology',
  name = 'oil-processing-2',
  icon_size = 256,
  icon_mipmaps = 4,
  icon = '__base__/graphics/technology/oil-gathering.png',
  icons = {{
    icon = '__base__/graphics/technology/oil-gathering.png',
    tint = cp2._tint
  }},
  prerequisites = {'oil-processing', 'production-science-pack'},
  effects = {
    {type = 'unlock-recipe', recipe = cp2.name},
    {type = 'unlock-recipe', recipe = or2.name},
  },
  unit = {
    count = 400,
    ingredients = {
      {'automation-science-pack', 1},
      {'logistic-science-pack', 1},
      {'chemical-science-pack', 1},
      {'production-science-pack', 1}
    },
    time = 60
  },
  order = 'd-a'
}})

redmew.add_prerequisite('kr-advanced-chemical-plant', 'oil-processing-2')
