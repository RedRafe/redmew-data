-- Compact raw rare metals
data:extend({
  {
		type = "item",
		name = "compact-raw-rare-metals",
		icon = "__k2-danger-ores__/graphics/icons/cluster-rare.png",
		icon_size = 64,
		icon_mipmaps = 4,
    pictures =
    {
      { size = 64, filename = "__k2-danger-ores__/graphics/icons/rare-1.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__k2-danger-ores__/graphics/icons/rare-2.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__k2-danger-ores__/graphics/icons/rare-3.png", scale = 0.25, mipmap_count = 4 }
    },
		subgroup = "raw-material",
		order = "ga[compact-raw-rare-metals]",
		stack_size = 200
  }
})