local ef1 = redmew.config['electric-furnace']
local ef2 = redmew.config['electric-furnace-2']
local ef3 = redmew.config['kr-advanced-furnace']

--=================================================================================================

redmew.update_prototype(ef1)

--=================================================================================================

data:extend({
  -- Item
  {
    name = ef2.name,
    type = 'item',
    icon = '__base__/graphics/icons/electric-furnace.png',
    icon_mipmaps = 4,
    icon_size = 64,
    icons = {{
      icon = '__base__/graphics/icons/electric-furnace.png',
      tint = ef2._tint
    }},
    order = 'c[electric-furnace]',
    place_result = ef2.name,
    stack_size = 50,
    subgroup = 'smelting-machine',
  },
  -- Recipe
  {
    name = ef2.name,
    type = 'recipe',
    enabled = false,
    energy_required = 5,
    ingredients = {
      { 'electric-furnace', 2 },
      { 'engine-unit', 10 },
      { 'refined-concrete', 100 },
      { 'copper-plate', 100 },
    },
    result = ef2.name,
  },
  -- Entity
  redmew.make_tier(ef2),
  -- Technology
  {
    type = 'technology',
    name = ef2._technology,
    icon_size = 256,
    icon_mipmaps = 4,
    icon = '__base__/graphics/technology/advanced-material-processing-2.png',
    icons = {{
      icon = '__base__/graphics/technology/advanced-material-processing-2.png',
      tint = ef2._tint
    }},
    effects = {{type = 'unlock-recipe', recipe = ef2.name}},
    prerequisites = {'advanced-material-processing-2', 'production-science-pack'},
    unit = {
      count = 300,
      ingredients = {
        {'automation-science-pack', 1},
        {'logistic-science-pack', 1},
        {'chemical-science-pack', 1},
        {'production-science-pack', 1}
      },
      time = 60
    },
    order = 'c-c-b'
  }
})

redmew.replace_ingredient(ef3.name, ef1.name, ef2.name, 2)
redmew.add_prerequisite(ef3.name, ef2._technology)