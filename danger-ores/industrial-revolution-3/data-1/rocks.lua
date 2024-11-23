data:extend({
  {
    type = 'recipe',
    name = 'gold-to-ruby',
    always_show_made_in = true,
    ingredients = {
      { type = 'item', name = 'gold-ore', amount = 50 },
    },
    results= {{ type = 'item', name = 'ruby-gem', amount = 1 }},
    enabled = true,
    energy_required = 60,
    category = 'alloying',
    icon_size = 64,
    icon = '__IndustrialRevolution3Assets1__/graphics/icons/64/ruby-gem.png',
    group = 'ir-processing',
    subgroup = 'ingots-4',
    order = 'zzz-z-z'
  },
  allow_productivity = true,
})

redmew.add_unlock('ir-pressing', 'gold-to-ruby')

data:extend({
  {
    type = 'recipe',
    name = 'graphite-to-diamond',
    always_show_made_in = true,
    ingredients = {
      { type = 'item', name = 'graphite', amount = 75 },
    },
    results = {{ type = 'item', name = 'diamond-gem', amount = 1 }},
    enabled = true,
    energy_required = 120,
    category = 'alloying',
    icon_size = 64,
    icon = '__IndustrialRevolution3Assets1__/graphics/icons/64/diamond-gem.png',
    group = 'ir-processing',
    subgroup = 'ingots-4',
    order = 'zzz-z-z',
    allow_productivity = true,
  }
})

redmew.add_unlock('ir-graphite', 'graphite-to-diamond')