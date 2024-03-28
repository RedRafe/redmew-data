redmew.replace_ingredient('small-electric-pole', 'wood', 'iron-stick', 2)

data.raw.item['small-electric-pole'].icon = '__redmew-data__/graphics/icons/small-electric-pole.png'

local pole = data.raw['electric-pole']['small-electric-pole']
pole.icon = '__redmew-data__/graphics/icons/small-electric-pole.png'
pole.pictures =
{
  layers = {
    {
      direction_count = 4,
      filename = '__redmew-data__/graphics/entity/small-electric-pole/small-electric-pole.png',
      height = 108,
      hr_version = {
        direction_count = 4,
        filename = '__redmew-data__/graphics/entity/small-electric-pole/hr-small-electric-pole.png',
        height = 220,
        priority = 'extra-high',
        scale = 0.5,
        shift = {
          0.03125,
          -1.34375
        },
        width = 70
      },
      priority = 'extra-high',
      shift = {
        0,
        -1.3125
      },
      width = 38
    },
    {
      direction_count = 4,
      draw_as_shadow = true,
      filename = '__redmew-data__/graphics/entity/small-electric-pole/small-electric-pole-shadow.png',
      height = 28,
      hr_version = {
        direction_count = 4,
        draw_as_shadow = true,
        filename = '__redmew-data__/graphics/entity/small-electric-pole/hr-small-electric-pole-shadow.png',
        height = 52,
        priority = 'extra-high',
        scale = 0.5,
        shift = {
          1.59375,
          0.09375
        },
        width = 256
      },
      priority = 'extra-high',
      shift = {
        1.5625,
        0.0625
      },
      width = 130
    }
  }
}