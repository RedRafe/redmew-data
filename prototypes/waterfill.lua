if not (settings.startup['do_enable_waterfill'] and settings.startup['do_enable_waterfill'].value) then return end

local selection_mode = function(color)
  return {
    border_color = color,
    cursor_box_type = 'copy',
    mode = { 'any-tile', 'deconstruct' },
    tile_filter_mode = 'whitelist',
    tile_filters = {
      'landfill',
      'stone-path',
      'concrete',
      'hazard-concrete-left',
      'hazard-concrete-right',
      'refined-concrete',
      'refined-hazard-concrete-left',
      'refined-hazard-concrete-right',
    },
  }
end

data:extend({
  {
    type = 'custom-input',
    name = 'rm-waterfill',
    key_sequence = 'SHIFT + ALT + J',
    action = 'spawn-item',
    item_to_spawn = 'rm-waterfill',
  },
  {
    type = 'shortcut',
    name = 'rm-waterfill',
    icon = '__redmew-data__/graphics/icons/waterfill.png',
    icon_size = 128,
    small_icon = '__redmew-data__/graphics/icons/waterfill.png',
    small_icon_size = 128,
    action = 'spawn-item',
    item_to_spawn = 'rm-waterfill',
    associated_control_input = 'rm-waterfill',
    technology_to_unlock = 'landfill',
  },
  {
    type = 'selection-tool',
    name = 'rm-waterfill',
    icon = '__base__/graphics/icons/deconstruction-planner.png',
    icon_size = 32,
    icon_mipmaps = 2,
    flags = { 'not-stackable', 'spawnable', 'only-in-cursor' },
    style = 'red',
    hidden = true,
    stack_size = 1,
    always_include_tiles = true,
    select = selection_mode({ r = 0, g = 1, b = 1 }),
    alt_select = selection_mode({ r = 0, g = 1, b = 1 }),
  },
})
