-- source Krastorio2, all rights to K2 authors for code and graphics
data:extend({
  -- Recipe Categories
  { type = 'recipe-category', name = 'redmew-barreling' },
  { type = 'recipe-category', name = 'redmew-unbarreling' },
  -- Item
  {
    type = 'item',
    name = 'barrel-machine',
    icon = '__redmew-data__/graphics/icons/barrel-machine.png',
    icon_size = 64,
    flags = {},
    subgroup = 'production-machine',
    order = 'a',
    place_result = 'barrel-machine',
    stack_size = 10,
  },
  -- Recipe
  {
    type = 'recipe',
    name = 'barrel-machine',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
      { type = 'item', name = 'steel-plate', amount = 5 },
      { type = 'item', name = 'pipe', amount = 10 },
      { type = 'item', name = 'iron-gear-wheel', amount = 20 },
      { type = 'item', name = 'steam-engine', amount = 1 },
      { type = 'item', name = 'iron-plate', amount = 20 },
      { type = 'item', name = 'electronic-circuit', amount = 2 },
    },
    results = { { type = 'item', name = 'barrel-machine',  amount = 1 } },
  },
  -- Entity
  {
    type = 'furnace',
    name = 'barrel-machine',
    icon = '__redmew-data__/graphics/icons/barrel-machine.png',
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { 'placeable-neutral', 'placeable-player', 'player-creation' },
    minable = { hardness = 0.5, mining_time = 0.5, result = 'barrel-machine' },
    max_health = 300,
    corpse = 'big-remnants',
    dying_explosion = 'medium-explosion',
    collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
    selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
    drawing_box = { { -1.5, -1.9 }, { 1.5, 1.5 } },
    module_specification = { module_slots = 3 },
    allowed_effects = { 'consumption', 'speed', 'productivity', 'pollution' },
    animation = make_4way_animation_from_spritesheet({
      layers = {
        {
          filename = '__redmew-data__/graphics/entity/barrel-machine/hr-barrel-machine.png',
          width = 244,
          height = 268,
          frame_count = 1,
          shift = util.by_pixel(-5, -4.5),
          scale = 0.5,
        },
        {
          filename = '__redmew-data__/graphics/entity/barrel-machine/hr-barrel-machine-shadow.png',
          width = 350,
          height = 219,
          frame_count = 1,
          shift = util.by_pixel(31.5, 10.75),
          draw_as_shadow = true,
          scale = 0.5,
        },
      },
    }),
    working_visualisations = {
      {
        north_position = util.by_pixel(30, -24),
        west_position = util.by_pixel(1, -49.5),
        south_position = util.by_pixel(-30, -48),
        east_position = util.by_pixel(-11, -1),
        apply_recipe_tint = 'primary',
        animation = {
          filename = '__redmew-data__/graphics/entity/barrel-machine/hr-boiling-green-patch.png',
          frame_count = 32,
          width = 30,
          height = 20,
          animation_speed = 0.5,
          scale = 0.5,
        },
      },
      {
        north_position = util.by_pixel(30, -24),
        west_position = util.by_pixel(1, -49.5),
        south_position = util.by_pixel(-30, -48),
        east_position = util.by_pixel(-11, -1),
        apply_recipe_tint = 'secondary',
        animation = {
          filename = '__redmew-data__/graphics/entity/barrel-machine/hr-boiling-green-patch-mask.png',
          frame_count = 32,
          width = 30,
          height = 20,
          animation_speed = 0.5,
          scale = 0.5,
        },
      },
      {
        apply_recipe_tint = 'tertiary',
        north_position = { 0, 0 },
        west_position = { 0, 0 },
        south_position = { 0, 0 },
        east_position = { 0, 0 },
        north_animation = {
          filename = '__redmew-data__/graphics/entity/barrel-machine/hr-boiling-window-green-patch.png',
          x = 0,
          frame_count = 1,
          width = 174,
          height = 119,
          shift = util.by_pixel(0, -5.25),
          scale = 0.5,
        },
        east_animation = {
          filename = '__redmew-data__/graphics/entity/barrel-machine/hr-boiling-window-green-patch.png',
          x = 174,
          frame_count = 1,
          width = 174,
          height = 119,
          shift = util.by_pixel(0, -5.25),
          scale = 0.5,
        },
        south_animation = {
          filename = '__redmew-data__/graphics/entity/barrel-machine/hr-boiling-window-green-patch.png',
          x = 348,
          frame_count = 1,
          width = 174,
          height = 119,
          shift = util.by_pixel(0, -5.25),
          scale = 0.5,
        },
      },
    },
    water_reflection = {
      pictures = {
        filename = '__redmew-data__/graphics/entity/barrel-machine/barrel-machine-reflection.png',
        priority = 'extra-high',
        width = 44,
        height = 44,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5,
      },
      rotate = false,
      orientation_to_variation = false,
    },
    vehicle_impact_sound = { filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65 },
    working_sound = {
      sound = { { filename = '__base__/sound/assembling-machine-t2-1.ogg', volume = 0.55 } },
      audible_distance_modifier = 0.5,
      fade_in_ticks = 4,
      fade_out_ticks = 20,
    },
    crafting_speed = 1,
    energy_source = { type = 'electric', usage_priority = 'secondary-input', emissions_per_minute = { pollution = 10 } },
    energy_usage = '250kW',
    source_inventory_size = 1,
    result_inventory_size = 1,
    crafting_categories = { 'redmew-barreling', 'redmew-unbarreling' },
    fluid_boxes = {
      -- Inputs
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.north, position = { -1, -1 } } },
      },
      -- Outputs
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "output", direction = defines.direction.south, position = { -1, 1 } } },
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "output", direction = defines.direction.south, position = { 1, 1 } } },
      },
    },
  },
  -- Technology
  {
    name = 'barrel-machine',
    type = 'technology',
    effects = { { type = 'unlock-recipe', recipe = 'barrel-machine' } },
    icon = '__redmew-data__/graphics/technology/barrel-machine.png',
    icon_size = 256,
    icon_mipmaps = 4,
    order = 'e-g',
    prerequisites = { 'fluid-handling' },
    unit = { count = 350, ingredients = { { 'automation-science-pack', 1 }, { 'logistic-science-pack', 1 } }, time = 60 },
  },
})
