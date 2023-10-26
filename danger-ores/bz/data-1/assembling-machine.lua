local am3 = redmew.config['assembling-machine-3']
local am4 = redmew.config['assembling-machine-4']

--=================================================================================================

redmew.update_prototype(am3)

--=================================================================================================

data:extend({
  -- Item
  {
    name = am4.name,
    type = 'item',
    icon = '__base__/graphics/icons/assembling-machine-3.png',
    icon_mipmaps = 4,
    icon_size = 64,
    icons = {{
      icon = '__base__/graphics/icons/assembling-machine-3.png',
      tint = am4._tint
    }},
    order = am4.order,
    place_result = am4.name,
    stack_size = 50,
    subgroup = 'production-machine',
  },
  -- Recipe
  {
    name = am4.name,
    type = 'recipe',
    enabled = false,
    ingredients = {
      { 'assembling-machine-3', 4 },
      { 'speed-module-2', 4 },
      { 'low-density-structure', 2 },
      { 'graphene', 40 },
    },
    result = am4.name,
  },
  -- Entity
  redmew.make_tier(am4),
  -- Technology
  {
  name = 'automation-4',
  type = 'technology',
  icon_size = 256,
  icon_mipmaps = 4,
  icon = '__base__/graphics/technology/automation-3.png',
  icons = {{
    icon = '__base__/graphics/technology/automation-3.png',
    tint = am4._tint
  }},
  effects = {{ type = 'unlock-recipe', recipe = am4.name }},
  prerequisites = { 'speed-module-2', 'automation-3', 'utility-science-pack', 'graphene' },
  unit = {
    count = 600,
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
