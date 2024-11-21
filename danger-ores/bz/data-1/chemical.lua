local cp1 = redmew.config['chemical-plant']
local cp2 = redmew.config['chemical-plant-2']
local or1 = redmew.config['oil-refinery']
local or2 = redmew.config['oil-refinery-2']

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
      { type = 'item', name = 'advanced-circuit', amount = 5 },
      { type = 'item', name = 'pipe', amount = 50 },
      { type = 'item', name = 'bakelite', amount = 12 },
      { type = 'item', name = 'titanium-palladium-flange', amount = 2 },
    },
    results = {{ type = 'item', name = cp2.name, amount = 1 }},
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
      { type = 'item', name = 'refined-concrete', amount = 100 },
      { type = 'item', name = 'temperature-sensor', amount = 1 },
      { type = 'item', name = 'zircaloy-4', amount = 15 },
      { type = 'item', name = 'crucible', amount = 10 },
  },
    results = {{ type = 'item', name = or2.name, amount = 1 }},
  },
  -- Entity
  redmew.make_tier(or2),
})

--=================================================================================================

data:extend({
  {
    type = 'technology',
    name = 'oil-processing-2',
    icons = {{
      icon = '__base__/graphics/technology/oil-gathering.png',
      tint = cp2._tint,
      icon_size = 256,
      icon_mipmaps = 4,
    }},
    prerequisites = { 'oil-processing', 'production-science-pack' },
    effects = {
      { type = 'unlock-recipe', recipe = cp2.name },
      { type = 'unlock-recipe', recipe = or2.name },
    },
    unit = {
      count = 400,
      ingredients = {
        { 'automation-science-pack', 1 },
        { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 },
        { 'production-science-pack', 1 }
      },
      time = 60
    },
    order = 'd-a'
  }
})
