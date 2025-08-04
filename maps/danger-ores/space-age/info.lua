local default = require 'utils.info_default'()
default.incompatibles['space-age'] = nil

return {
  name = 'DangerOres/SpaceAge',
  ID = 'do:sa',
  dependencies = {
    ['space-age'] = true,
  },
  compatibles = {},
  incompatibles = default.incompatibles
}
