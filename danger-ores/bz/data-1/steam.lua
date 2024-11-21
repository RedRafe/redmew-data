local bo1 = redmew.config['boiler']
local bo2 = redmew.config['boiler-2']
local se1 = redmew.config['steam-engine']
local se2 = redmew.config['steam-engine-2']

--=================================================================================================

redmew.update_prototype(bo1)

--=================================================================================================

data:extend({
  -- Item
  {
    name = bo2.name,
    type = 'item',
    icons = {{
      icon = '__base__/graphics/icons/boiler.png',
      tint = bo2._tint,
      icon_mipmaps = 4,
      icon_size = 64,
    }},
    order = 'b[steam-power]-a[boiler]',
    place_result = bo2.name,
    stack_size = 50,
    subgroup = 'energy',
  },
  -- Recipe
  {
    name = bo2.name,
    type = 'recipe',
    enabled = false,
    energy_required = 0.5,
    ingredients = {
      { type = 'item', name = 'boiler', amount = 3 },
      { type = 'item', name = 'steel-furnace', amount = 3 },
      { type = 'item', name = 'bakelite', amount = 20 },
      { type = 'item', name = 'temperature-sensor', amount = 1 },
      { type = 'item', name = 'lead-plate', amount = 15 },
      { type = 'item', name = 'crucible', amount = 1 },
    },
    results = {{ type = 'item', name = bo2.name, amount = 1 }},
  },
  -- Entity
  redmew.make_tier(bo2),
})

--=================================================================================================

redmew.update_prototype(se1)

--=================================================================================================

data:extend({
  -- Item
  {
    name = se2.name,
    type = 'item',
    icons = {{
      icon = '__base__/graphics/icons/steam-engine.png',
      tint = se2._tint,
      icon_mipmaps = 4,
      icon_size = 64,
    }},
    order = 'b[steam-power]-b[steam-engine]',
    place_result = se2.name,
    stack_size = 10,
    subgroup = 'energy',
  },
  -- Recipe
  {
    name = se2.name,
    type = 'recipe',
    enabled = false,
    energy_required = 0.5,
    ingredients = {
      { type = 'item', name = 'steam-engine', amount = 2 },
      { type = 'item', name = 'engine-unit', amount = 5 },
      { type = 'item', name = 'steel-plate', amount = 10 },
      { type = 'item', name = 'pipe', amount = 25 },
      { type = 'item', name = 'bakelite', amount = 12 },
      { type = 'item', name = 'temperature-sensor', amount = 1 },
    },
    results = {{ type = 'item', name = se2.name, amount = 1 }},
  },
  -- Entity
  redmew.make_tier(se2),
})

--=================================================================================================

data:extend({{
  type = 'technology',
  name = 'steam-power-2',
  icons = {{
    icon = '__base__/graphics/technology/steam-power.png',
    tint = se2._tint,
    icon_size = 256,
    icon_mipmaps = 4,
  }},
  prerequisites = { 'chemical-science-pack', 'advanced-material-processing-2' },
  effects = {
    { type = 'unlock-recipe', recipe = bo2.name },
    { type = 'unlock-recipe', recipe = se2.name },
  },
  unit = {
    count = 350,
    ingredients = {
      { 'automation-science-pack', 1 },
      { 'logistic-science-pack', 1 },
      { 'chemical-science-pack', 1 }
    },
    time = 30
  },
  order = 'd-a'
}})
