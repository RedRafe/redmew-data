local default = require 'utils.info_default'()
default.incompatibles['angelsrefining'] = nil
default.incompatibles['bobplates'] = nil

return {
  name = 'DangerOres/AngelBob',
  ID = 'do:ab',
  dependencies = {
    ['angelsrefining'] = true,
    ['bobplates'] = true,
  },
  incompatibles = default.incompatibles
}
