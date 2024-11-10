local cc_silo = circuit_connector_definitions.create(universal_connector_template, {{ 
  variation     = 26,
  main_offset   = util.by_pixel(64, 108),   --util.by_pixel(18.5, 41),
  shadow_offset = util.by_pixel(66, 110), --util.by_pixel(20.5, 56.5),
  show_shadow   = false
}})

data:extend({
  {
    name = 'tunnel',
    type = 'linked-container',
    order = 'tunnel',
    icon = '__redmew-data__/graphics/icons/rocket-silo.png',
    icon_size = 64,
    corpse = 'big-remnants',
    picture = {
      layers = {
        -- Shadow
        {
          filename = '__base__/graphics/entity/rocket-silo/00-rocket-silo-shadow.png',
          priority = 'medium',
          width = 304,
          height = 290,
          draw_as_shadow = true,
          dice = 2,
          shift = util.by_pixel(8, 2),
          hr_version = {
            filename = '__base__/graphics/entity/rocket-silo/hr-00-rocket-silo-shadow.png',
            priority = 'medium',
            width = 612,
            height = 578,
            draw_as_shadow = true,
            dice = 2,
            shift = util.by_pixel(7, 2),
            scale = 0.5,
          },
        },
        -- Hole
        {
          filename = '__base__/graphics/entity/rocket-silo/01-rocket-silo-hole.png',
          width = 202,
          height = 136,
          shift = util.by_pixel(-6, 16),
          hr_version = {
            filename = '__base__/graphics/entity/rocket-silo/hr-01-rocket-silo-hole.png',
            width = 400,
            height = 270,
            shift = util.by_pixel(-5, 16),
            scale = 0.5
          },
        },
        -- Structure
        {
          filename = '__redmew-data__/graphics/entity/rocket-silo/06-rocket-silo.png',
          priority = 'extra-high',
          width = 300,
          height = 300,
          hr_version = {
            filename = '__redmew-data__/graphics/entity/rocket-silo/hr-06-rocket-silo.png',
            priority = 'extra-high',
            width = 608,
            height = 596,
            scale = 0.5
          },
        },
      },
    },
    placeable_by = { item = 'tunnel', count = 1 },
    collision_mask = { 'item-layer', 'object-layer', 'player-layer', 'water-tile' },
    -- for collision box one tile is 0.4 x 0.4
    dying_explosion = 'rocket-silo-explosion',
    collision_box = { { -4.40, -4.40 }, { 4.40, 4.40 } },
    selection_box = { { -4.5, -4.5 }, { 4.5, 4.5 } },
    selection_priority = 49, -- We set this to 49 so that the medium electric pole that we put on top of it has a higher selection priority.
    drawing_box = { { -4.5, -4.5 }, { 4.5, 4.5 } },
    allow_copy_paste = true,
    minable = { mining_time = 5, result = 'tunnel' },
    max_health = 400,
    is_military_target = false,
    create_ghost_on_death = true,
    selectable_in_game = true,
    inventory_size = 50,
    inventory_type = 'with_filters_and_bar',
    scale_info_icons = false,
    gui_mode = 'none',
    circuit_wire_connection_point = cc_silo.points,
    circuit_connector_sprites = cc_silo.sprites,
    circuit_wire_max_distance = 15,
    flags = { 'not-rotatable', 'player-creation' },
  },
  {
    name = 'tunnel',
    type = 'item',
    order = 'tunnel',
    icon = '__redmew-data__/graphics/icons/rocket-silo.png',
    icon_size = 64,
    stack_size = 10,
    place_result = 'tunnel',
    subgroup = 'transport'
  },
  {
    name = 'tunnel',
    type = 'recipe',
    ingredients = {
      { type = 'item', name = 'copper-plate', amount = 140 },
      { type = 'item', name = 'steel-plate', amount = 75 },
      { type = 'item', name = 'refined-concrete', amount = 500 },
    },
    results = {{ type = 'item', name = 'tunnel', amount = 1 }},
    enabled = false,
  }
})

redmew.add_unlock('rocket-silo', 'tunnel')
