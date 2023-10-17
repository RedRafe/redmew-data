local matter = require "__Krastorio2__.lib.public.data-stages.matter-util"

-- Compact rare metals
local compact = {
  k2matter = {
    item_name = "compact-raw-rare-metals",
    minimum_conversion_quantity = 10,
    matter_value = 5,
    energy_required = 1,
    only_deconversion = false,
    need_stabilizer = false,
    unlocked_by_technology = "kr-matter-rare-metals-processing",
  },
  k2baseicon = "stone",
  icon = {
    icon = "__redmew-data__/graphics/icons/cluster-rare.png",
    icon_size = 64, 
    icon_mipmaps = 4,
    scale = 1.25,
  },
}
matter.createMatterRecipe(compact.k2matter)

redmew.remove_recipe_effect('kr-matter-rare-metals-processing', 'raw-rare-metals-to-matter')
redmew.remove_recipe_effect('kr-matter-rare-metals-processing', 'matter-to-raw-rare-metals')

-- disable wood conversion into matter
data.raw.recipe['wood-to-matter'].hidden = true
redmew.remove_recipe_effect('kr-matter-processing', 'wood-to-matter')

data.raw['assembling-machine']['kr-matter-assembler'].scale_entity_info_icon = true
data.raw['assembling-machine']['kr-matter-plant'].scale_entity_info_icon = true
