local matter = require '__Krastorio2__.prototypes.libraries.matter'

matter.make_recipes({
  material = { type = 'item', name = 'compact-raw-rare-metals', amount = 10 },
  matter_count = 5,
  energy_required = 1,
  unlocked_by = 'kr-matter-rare-metals-processing',
})

redmew.remove_recipe_effect('kr-matter-rare-metals-processing', 'raw-rare-metals-to-matter')
redmew.remove_recipe_effect('kr-matter-rare-metals-processing', 'matter-to-raw-rare-metals')

-- disable wood conversion into matter
data.raw.recipe['wood-to-matter'].hidden = true
redmew.remove_recipe_effect('kr-matter-processing', 'wood-to-matter')
