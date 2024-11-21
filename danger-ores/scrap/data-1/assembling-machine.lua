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
    icons = {{
      icon = '__base__/graphics/icons/assembling-machine-3.png',
      tint = am4._tint,
      icon_mipmaps = 4,
      icon_size = 64,
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
      { type = 'item', name = 'assembling-machine-3', amount = 4 },
      { type = 'item', name = 'speed-module-2', amount = 4 },
    },
    results = {{ type = 'item', name = am4.name, amount = 1 }},
  },
  -- Entity
  redmew.make_tier(am4),
  -- Technology
  {
  name = 'automation-4',
  type = 'technology',
  icons = {{
    icon = '__base__/graphics/technology/automation-3.png',
    tint = am4._tint,
    icon_size = 256,
    icon_mipmaps = 4,
  }},
  effects = {{ type = 'unlock-recipe', recipe = am4.name }},
  prerequisites = { 'speed-module-2', 'automation-3', 'utility-science-pack' },
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
