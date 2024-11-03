data:extend({
  {
    type = 'recipe',
    name = 'stone-to-uranium',
    always_show_made_in = true,
    ingredients = {
      { type = 'item', name = 'stone', amount = 15 },
      { type = 'item', name = 'gold-ore', amount = 5 },
      { type = 'fluid', name = 'sulfuric-acid', amount = 10 }
    },
    results = {{ type = 'item', name = 'uranium-ore', amount = 1 }},
    enabled = false,
    energy_required = 1,
    category = 'mixing',
    icon_size = 64,
    icon = '__redmew-data__/graphics/icons/stone-to-uranium.png',
    group = 'ir-processing',
    subgroup = 'powder',
    order = 'zzz-z-z'
  }
})

redmew.whitelist_productivity('stone-to-uranium')
redmew.add_unlock('uranium-processing', 'stone-to-uranium')
