-- Yellowcake (Uranium powder)
data:extend({
	{
		type = 'item',
		name = 'yellowcake',
		icon = '__redmew-data__/graphics/icons/uranium-powder.png',
		icon_size = 64,
		icon_mipmaps = 4,
		pictures = {
			{
				layers =
				{
					{
						size = 64,
						filename = '__redmew-data__/graphics/icons/uranium-powder.png',
						scale = 0.25,
						mipmap_count = 4
					},
					{
						draw_as_light = true,
						flags = {'light'},
						blend_mode = 'additive',
						tint = {r = 0.3, g = 0.3, b = 0.3, a = 0.3},
						size = 64,
						filename = '__redmew-data__/graphics/icons/uranium-powder-light.png',
						scale = 0.25,
						mipmap_count = 4
					}
				}
			},
			{
				layers =
				{
					{
						size = 64,
						filename = '__redmew-data__/graphics/icons/uranium-powder-1.png',
						scale = 0.25,
						mipmap_count = 4
					},
					{
						draw_as_light = true,
						flags = {'light'},
						blend_mode = 'additive',
						tint = {r = 0.3, g = 0.3, b = 0.3, a = 0.3},
						size = 64,
						filename = '__redmew-data__/graphics/icons/uranium-powder-1-light.png',
						scale = 0.25,
						mipmap_count = 4
					}
				}
			},
			{
				layers =
				{
					{
						size = 64,
						filename = '__redmew-data__/graphics/icons/uranium-powder-2.png',
						scale = 0.25,
						mipmap_count = 4
					},
					{
						draw_as_light = true,
						flags = {'light'},
						blend_mode = 'additive',
						tint = {r = 0.3, g = 0.3, b = 0.3, a = 0.3},
						size = 64,
						filename = '__redmew-data__/graphics/icons/uranium-powder-2-light.png',
						scale = 0.25,
						mipmap_count = 4
					}
				}
			}
		},
		subgroup = 'raw-material',
		order = 'g[uranium-powder]',
		stack_size = 200
	}
})

data.raw.resource['uranium-ore'].minable =
{
  mining_particle = 'stone-particle',
  mining_time = 1,
  result = 'uranium-ore'
}