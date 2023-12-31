data:extend({
  {
    type = 'recipe',
    name = 'gold-to-ruby',
    always_show_made_in = true,
    ingredients = {
      { type = 'item', name = 'gold-ore', amount = 50 },
    },
    result = 'ruby-gem',
    enabled = true,
    energy_required = 60,
    category = 'alloying',
    icon_size = 64,
    icon = '__IndustrialRevolution3Assets1__/graphics/icons/64/ruby-gem.png',
    group = 'ir-processing',
    subgroup = 'ingots-4',
    order = 'zzz-z-z'
  }
})

redmew.whitelist_productivity('gold-to-ruby')
redmew.add_unlock('ir-pressing', 'gold-to-ruby')

data:extend({
  {
    type = 'recipe',
    name = 'graphite-to-diamond',
    always_show_made_in = true,
    ingredients = {
      { type = 'item', name = 'graphite', amount = 75 },
    },
    result = 'diamond-gem',
    enabled = true,
    energy_required = 120,
    category = 'alloying',
    icon_size = 64,
    icon = '__IndustrialRevolution3Assets1__/graphics/icons/64/diamond-gem.png',
    group = 'ir-processing',
    subgroup = 'ingots-4',
    order = 'zzz-z-z'
  }
})

redmew.whitelist_productivity('graphite-to-diamond')
redmew.add_unlock('ir-graphite', 'graphite-to-diamond')