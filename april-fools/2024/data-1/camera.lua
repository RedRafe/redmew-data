data:extend({
  {
    type = 'custom-input',
    name = 'camera',
    key_sequence = 'CONTROL + W',
    action = 'lua',
    enabled = true,
    enabled_while_in_cutscene = false,
    enabled_while_spectating = true,
  },
  {
    type = 'shortcut',
    name = 'camera',
    icon = {
      filename = '__redmew-data__/graphics/icons/camera.png',
      size = 512,
      mipmap_count = 1,
      flags = { 'gui-icon' },
    },
    action = 'lua',
    toggleable = true,
    associated_control_input = 'camera',
  },
})