data:extend({
  {
    type = 'recipe',
    name = 'stone-to-uranium',
    always_show_made_in = true,
    ingredients = {
      { type = 'item', name = 'stone', amount = 20 },
      { type = 'fluid', name = 'sulfuric-acid', amount = 1 }
    },
    result = 'uranium-ore',
    enabled = false,
    energy_required = 1,
    category = 'crafting-with-fluid',
    icon_size = 64,
    icon = '__redmew-data__/graphics/icons/stone-to-uranium.png'
  }
})

redmew.whitelist_productivity('stone-to-uranium')
redmew.add_unlock('uranium-processing', 'stone-to-uranium')