local default = require 'utils.info_default'()
default.incompatibles['bobplates'] = nil

return {
  name = 'DangerOres/Bob',
  ID = 'do:bm',
  dependencies = {
    ['bobplates'] = true,
  },
  incompatibles = default.incompatibles
}
