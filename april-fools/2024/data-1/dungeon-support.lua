local substation = table.deepcopy(data.raw['electric-pole'].substation)
local tint = {r = 033 / 255, g = 160 / 255, b = 087 / 255, a = 0.9}

data:extend({
  {
    type = 'simple-entity-with-owner',
    name = 'dungeon-support',
    icons = {
      {
        icon = '__base__/graphics/icons/substation.png',
        icon_size = 64,
        icon_mipmaps = 4,
        tint = tint,
      }
    },
    flags = {'placeable-neutral', 'player-creation', 'not-rotatable', 'placeable-off-grid'},
    minable = {mining_time = 2, result = 'dungeon-support'},
    max_health = 200,
    corpse = 'substation-remnants',
    dying_explosion = 'substation-explosion',
    track_coverage_during_build_by_moving = true,
    resistances =
    {
      {
        type = 'fire',
        percent = 90
      }
    },
    is_military_target = true,
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    damaged_trigger_effect = substation.damaged_trigger_effect,
    drawing_box = {{-1, -3}, {1, 1}},
    pictures =
    {
      layers =
      {
        {
          filename = '__redmew-data__/graphics/entity/hr-substation.png',
          priority = 'high',
          width = 138,
          height = 270,
          direction_count = 4,
          shift = util.by_pixel(0, 1-32),
          scale = 0.5,
        },
        {
          filename = '__base__/graphics/entity/substation/substation-shadow.png',
          priority = 'high',
          width = 186,
          height = 52,
          direction_count = 4,
          shift = util.by_pixel(62, 42-32),
          draw_as_shadow = true,
          hr_version =
          {
            filename = '__base__/graphics/entity/substation/hr-substation-shadow.png',
            priority = 'high',
            width = 370,
            height = 104,
            direction_count = 4,
            shift = util.by_pixel(62, 42-32),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    vehicle_impact_sound = substation.vehicle_impact_sound,
    open_sound = substation.open_sound,
    close_sound = substation.close_sound,
    working_sound =
    {
      sound =
      {
        filename = '__base__/sound/substation.ogg',
        volume = 0.4
      },
      max_sounds_per_type = 3,
      audible_distance_modifier = 0.32,
      fade_in_ticks = 30,
      fade_out_ticks = 40,
      use_doppler_shift = false
    },
    water_reflection =
    {
      pictures =
      {
        filename = '__base__/graphics/entity/substation/substation-reflection.png',
        priority = 'extra-high',
        width = 20,
        height = 28,
        shift = util.by_pixel(0, 55),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    name = 'dungeon-support',
    type = 'item',
    order = 'dungeon-support',
    icons = {
      {
        icon = '__base__/graphics/icons/substation.png',
        icon_size = 64,
        icon_mipmaps = 4,
        tint = tint,
      }
    },
    stack_size = 25,
    place_result = 'dungeon-support',
    subgroup = 'storage'
  },
  {
    name = 'dungeon-support',
    type = 'recipe',
    ingredients = {
      {'refined-concrete', 9},
      {'low-density-structure', 6},
      {'iron-stick', 21},
    },
    result = 'dungeon-support',
    enabled = false,
  },
  {
    type = 'technology',
    name = 'dungeon-support',
    icons = {
      {
        icon_size = 256,
        icon_mipmaps = 4,
        icon = '__base__/graphics/technology/electric-energy-distribution-2.png',
        tint = tint,
      }
    },
    effects =
    {
      {
        type = 'unlock-recipe',
        recipe = 'dungeon-support'
      }
    },
    prerequisites = {'low-density-structure', 'concrete'},
    unit =
    {
      count = 600,
      ingredients =
      {
        {'automation-science-pack', 1},
        {'logistic-science-pack', 1},
        {'chemical-science-pack', 1}
      },
      time = 45
    },
    order = 'c-e-c'
  },
})