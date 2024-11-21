data:extend({
  -- Recipe Uranium processing
  {
    type = 'recipe',
    name = 'uranium-processing',
    always_show_made_in = true,
    energy_required = 8,
    enabled = false,
    category = 'chemistry',
    ingredients =
    {
      { type = 'item', name = 'uranium-ore', amount = 10 },
      { type = 'fluid', name = 'sulfuric-acid', amount = 5 }
    },
    icon = '__redmew-data__/graphics/icons/uranium-powder.png',
    icon_size = 64, icon_mipmaps = 4,
    subgroup = 'raw-material',
    order = 'k[uranium-processing-1]',
    results =
    {
      { type = 'item', name = 'yellowcake', amount = 2 },
      { type = 'item', name = 'stone', amount = 5 },
      { type = 'item', name = 'iron-ore', amount = 3 }
    },
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.642, b = 0.261, a = 1.000}, -- #ffa342ff
      secondary = {r = 1.000, g = 0.722, b = 0.376, a = 1.000}, -- #ffb85fff
      tertiary = {r = 0.854, g = 0.659, b = 0.576, a = 1.000}, -- #d9a892ff
      quaternary = {r = 1.000, g = 0.494, b = 0.271, a = 1.000}, -- #ff7e45ff
    }
  },
  -- Recipe Yellowcake processing
  {
    type = 'recipe',
    name = 'uranium-processing-2',
    always_show_made_in = true,
    energy_required = 30,
    enabled = false,
    category = 'centrifuging',
    ingredients = {{ type = 'item', name = 'yellowcake', amount = 3 }},
    icon = '__base__/graphics/icons/uranium-processing.png',
    icon_size = 64, icon_mipmaps = 4,
    subgroup = 'intermediate-product',
    order = 'r[uranium-processing]-b3',
    results =
    {
      {
        type = 'item',
        name = 'uranium-235',
        probability = 0.007,
        amount = 1
      },
      {
        type = 'item',
        name = 'uranium-238',
        probability = 0.993,
        amount = 1
      }
    }
  },
  -- Technology Uranium Processing 2
  {
    type = 'technology',
    name = 'uranium-processing-2',
    localised_description = {'technology-description.uranium-processing-2'},
    icon_size = 256, icon_mipmaps = 1,
    icon = '__redmew-data__/graphics/technology/uranium-processing-2.png',
    effects =
    {
      {
        type = 'unlock-recipe',
        recipe = 'uranium-processing-2'
      }
    },
    prerequisites = {'uranium-processing', 'concrete'},
    unit =
    {
      ingredients =
      {
        { 'automation-science-pack', 1 },
        { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 },
      },
      time = 60,
      count = 200
    },
    order = 'e-p-b-c'
  },
})

redmew.whitelist_productivity('uranium-processing')
redmew.whitelist_productivity('uranium-processing-2')
redmew.move_recipe_unlock('centrifuge',        'uranium-processing', 'uranium-processing-2')
redmew.move_recipe_unlock('uranium-fuel-cell', 'uranium-processing', 'uranium-processing-2')
