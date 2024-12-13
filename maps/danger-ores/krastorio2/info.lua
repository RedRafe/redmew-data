local default = require 'utils.info_default'
default.incompatibles['Krastorio2'] = nil

return {
  name = 'DangerOres/Krastorio2',
  ID = 'do:k2',
  dependencies = {
    ['Krastorio2'] = true,
    ['Krastorio2Assets'] = true
  },
  compatibles = {
    ['deadlock-beltboxes-loaders'] = true
  },
  incompatibles = default.incompatibles
}
