local hit_effects = require '__base__.prototypes.entity.hit-effects'
local item_sounds = require '__base__.prototypes.item_sounds'
local sounds = require '__base__.prototypes.entity.sounds'

data:extend({
  -- Item
  {
    type = 'item',
    name = 'sort-house',
    icon = '__redmew-data__/graphics/icons/sort-house.png',
    subgroup = 'storage',
    order = 'a[items]-d[sort-house]',
    place_result = 'sort-house',
    stack_size = 10,
    inventory_move_sound = item_sounds.metal_chest_inventory_move,
    pick_sound = item_sounds.metal_chest_inventory_pickup,
    drop_sound = item_sounds.metal_chest_inventory_move,
  },
  -- Recipe
  {
    type = 'recipe',
    name = 'sort-house',
    energy_required = 30,
    enabled = false,
    ingredients = {
      { type = 'item', name = 'steel-plate', amount = 50 },
      { type = 'item', name = 'stone-brick', amount = 50 },
      { type = 'item', name = 'iron-chest', amount = 8 },
    },
    results = { { type = 'item', name = 'sort-house', amount = 1 } },
  },
  -- Entity
  {
    type = 'container',
    name = 'sort-house',
    icon = '__redmew-data__/graphics/icons/sort-house.png',
    flags = { 'placeable-player', 'player-creation', 'not-rotatable' },
    fast_replaceable_group = 'container',
    minable = { mining_time = 1, result = 'sort-house' },
    collision_box = { { -3.75, -3.75 }, { 3.75, 3.75 } },
    selection_box = { { -4, -4 }, { 4, 4 } },
    inventory_size = 40,
    inventory_type = 'with_filters_and_bar',
    max_health = 2400,
    damaged_trigger_effect = hit_effects.entity(),
    resistances = {
      { type = 'physical', percent = 50 },
      { type = 'fire', percent = 75 },
      { type = 'impact', percent = 75 },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    picture = {
      filename = '__redmew-data__/graphics/entity/sort-house/sort-house.png',
      priority = 'extra-high',
      width = 512,
      height = 512,
      scale = 0.5  / 6 * 8,
    },
    water_reflection = {
      pictures = {
        filename = '__redmew-data__/graphics/entity/sort-house/sort-house-reflection.png',
        priority = 'extra-high',
        width = 60,
        height = 50,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5 * 8 / 6,
      },
      rotate = false,
      orientation_to_variation = false,
    },
    circuit_connector_sprites = {
      points =
      {
        wire = { red = {2.559, 1.059}, green = {2.328, 1.223} },
        shadow = { red = {2.559 + 1.5, 1.059 + 1.5}, green = {2.328 + 1.5, 1.223 + 1.5} }
      }
    },
    circuit_wire_max_distance = 24,
  },
  -- Technology
  {
    type = 'technology',
    name = 'sort-house',
    icon = '__redmew-data__/graphics/technology/sort-house.png',
    icon_size = 256,
    effects = {
      { type = 'unlock-recipe', recipe = 'sort-house' },
    },
    prerequisites = { 'steel-processing' },
    unit = {
      count = 50,
      ingredients = {
        { 'automation-science-pack', 1 },
        { 'logistic-science-pack', 1 },
      },
      time = 30,
    },
    order = 'c-a',
  },
})
