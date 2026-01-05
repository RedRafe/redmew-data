local default = require 'utils.info_default'()
default.incompatibles['angelsrefining'] = nil

return {
  name = 'DangerOres/Angel',
  ID = 'do:am',
  dependencies = {
    ['angelsrefining'] = true,
  },
  incompatibles = default.incompatibles
}
