if not (settings.startup['do:enable_waterfill'] and settings.startup['do:enable_waterfill'].value) then return end

local factory_tiles = function() 
  return {
    "landfill",
    "stone-path",
    "concrete",
    "hazard-concrete-left",
    "hazard-concrete-right",
    "refined-concrete",
    "refined-hazard-concrete-left",
    "refined-hazard-concrete-right",
  }
end

data:extend({
  {
    type = "shortcut",
    name = "rm-waterfill",
    icon = {
      filename = "__redmew-data__/graphics/icons/waterfill.png",
      size = 128,
      mipmap_count = 1,
      flags = { "gui-icon" },
    },
    action = "spawn-item",
    item_to_spawn = "rm-waterfill",
    associated_control_input = "rm-waterfill",
    technology_to_unlock = "landfill",
  },
  {
    type = "selection-tool",
    name = "rm-waterfill",
    icon = "__base__/graphics/icons/shortcut-toolbar/mip/new-deconstruction-planner-x32-white.png",
    icon_size = 32,
    icon_mipmaps = 2,
    flags = { "hidden", "not-stackable", "spawnable", "only-in-cursor" },
    stack_size = 1,
    selection_color = { r = 0, g = 1, b = 1 },
    alt_selection_color = { r = 0, g = 1, b = 1 },
    selection_mode = { "any-tile" },
    alt_selection_mode = { "any-tile" },
    selection_cursor_box_type = "not-allowed",
    alt_selection_cursor_box_type = "not-allowed",
    always_include_tiles = true,
    show_in_library = false,
    tile_filters = factory_tiles(),
    alt_tile_filters = factory_tiles(),
    tile_filter_mode = "whitelist",
    alt_tile_filter_mode = "whitelist",
  },
  {
    type = "custom-input",
    name = "rm-waterfill",
    key_sequence = "SHIFT + ALT + J",
    action = "spawn-item",
    item_to_spawn = "rm-waterfill",
  },
})
