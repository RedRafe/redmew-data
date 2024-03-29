data:extend({
  {
    type = 'custom-input',
    name = 'teleport-up',
    key_sequence = 'CONTROL + UP',
    action = 'lua',
    enabled = true,
    enabled_while_in_cutscene = false,
    enabled_while_spectating = true,
  },
  {
    type = 'custom-input',
    name = 'teleport-down',
    key_sequence = 'CONTROL + DOWN',
    action = 'lua',
    enabled = true,
    enabled_while_in_cutscene = false,
    enabled_while_spectating = true,
  },
  {
    type = 'shortcut',
    name = 'teleport-up',
    icon = {
      filename = '__redmew-data__/graphics/icons/arrow-up.png',
      size = 512,
      mipmap_count = 1,
      flags = { 'gui-icon' },
    },
    action = 'lua',
    toggleable = false,
    associated_control_input = 'teleport-up',
  },
  {
    type = 'shortcut',
    name = 'teleport-down',
    icon = {
      filename = '__redmew-data__/graphics/icons/arrow-down.png',
      size = 512,
      mipmap_count = 1,
      flags = { 'gui-icon' },
    },
    action = 'lua',
    toggleable = false,
    associated_control_input = 'teleport-down',
  },
})