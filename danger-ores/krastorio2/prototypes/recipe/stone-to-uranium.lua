local stone_to_uranium_recipe = {
  type = "recipe",
  name = "stone-to-uranium",
  ingredients = {{"stone", 20}, {type = "fluid", name = "sulfuric-acid", amount = 10}},
  result = "uranium-ore",
  enabled = false,
  energy_required = 1,
  category = "crafting-with-fluid",
  icon_size = 64,
  icon = "__k2-danger-ores__/graphics/stone-to-uranium.png"
}

data:extend{stone_to_uranium_recipe}

KDO.add_unlock("uranium-processing", "stone-to-uranium")
KDO.whitelist_productivity("stone-to-uranium")
