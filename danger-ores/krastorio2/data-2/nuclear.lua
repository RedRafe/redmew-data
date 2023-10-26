local nr1 = redmew.config['nuclear-reactor']
local nr2 = redmew.config['nuclear-reactor-2']
local he1 = redmew.config['heat-exchanger']
local he2 = redmew.config['heat-exchanger-2']
local st1 = redmew.config['steam-turbine']
local st2 = redmew.config['steam-turbine-2']

--=================================================================================================

redmew.update_prototype(nr1)

--=================================================================================================

data:extend({
  -- Item
  {
    name = nr2.name,
    type = 'item',
    icon = '__base__/graphics/icons/nuclear-reactor.png',
    icon_mipmaps = 4,
    icon_size = 64,
    icons = {{
      icon = '__base__/graphics/icons/nuclear-reactor.png',
      tint = nr2._tint
    }},
    order = 'f[nuclear-energy]-a[reactor]',
    place_result = nr2.name,
    stack_size = 1,
    subgroup = 'energy',
  },
  -- Recipe
  {
    name = nr2.name,
    type = 'recipe',
    enabled = false,
    energy_required = 8,
    ingredients = {
      { 'nuclear-reactor', 4 },
      { 'low-density-structure', 100 },
      { 'processing-unit', 100 },
      { 'refined-concrete', 1000 },
      { 'heat-pipe', 100 },
    },
    result = nr2.name,
  },
  -- Entity
  redmew.make_tier(nr2),
})

--=================================================================================================

redmew.update_prototype(he1)

--=================================================================================================

data:extend({
  -- Item
  {
    name = he2.name,
    type = 'item',
    icon = '__base__/graphics/icons/heat-boiler.png',
    icon_mipmaps = 4,
    icon_size = 64,
    icons = {{
      icon = '__base__/graphics/icons/heat-boiler.png',
      tint = he2._tint
    }},
    order = 'f[nuclear-energy]-c[heat-exchanger]',
    place_result = he2.name,
    stack_size = 50,
    subgroup = 'energy',
  },
  -- Recipe
  {
    name = he2.name,
    type = 'recipe',
    enabled = false,
    energy_required = 3,
    ingredients = {
      { 'heat-exchanger', 2 },
      { 'low-density-structure', 10 },
      { 'heat-pipe', 10 },
    },
    result = he2.name,
  },
  -- Entity
  redmew.make_tier(he2),
})

--=================================================================================================

redmew.update_prototype(st1)

--=================================================================================================

data:extend({
  -- Item
  {
    name = st2.name,
    type = 'item',
    icon = '__base__/graphics/icons/steam-turbine.png',
    icon_mipmaps = 4,
    icon_size = 64,
    icons = {{
      icon = '__base__/graphics/icons/steam-turbine.png',
      tint = st2._tint
    }},
    order = 'f[nuclear-energy]-d[steam-turbine]',
    place_result = st2.name,
    stack_size = 10,
    subgroup = 'energy',
  },
  -- Recipe
  {
    type = 'recipe',
    name = st2.name,
    enabled = false,
    energy_required = 3,
    ingredients = {
      { 'steam-turbine', 2 },
      { 'low-density-structure', 25 },
      { 'processing-unit', 25 },
      { 'heat-pipe', 15 },
    },
    result = st2.name,
  },
  -- Entity
  redmew.make_tier(st2),
})

--=================================================================================================

data.raw['heat-pipe']['heat-pipe'].heat_buffer.max_temperature = nr2.heat_buffer.max_temperature

data:extend({{
  type = 'technology',
  name = 'nuclear-power-2',
  icon_size = 256,
  icon_mipmaps = 4,
  icon = '__base__/graphics/technology/nuclear-power.png',
  icons = {{
    icon = '__base__/graphics/technology/nuclear-power.png',
    tint = nr2._tint
  }},
  prerequisites = {'nuclear-power', 'production-science-pack'},
  effects = {
    {type = 'unlock-recipe', recipe = st2.name},
    {type = 'unlock-recipe', recipe = nr2.name},
    {type = 'unlock-recipe', recipe = he2.name},
  },
  unit = {
    count = 400,
    ingredients = {
      {'automation-science-pack', 1},
      {'logistic-science-pack', 1},
      {'chemical-science-pack', 1},
      {'production-science-pack', 1},
      {'utility-science-pack', 1}
    },
    time = 30
  },
  order = 'd-a'
}})
