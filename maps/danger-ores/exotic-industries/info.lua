local default = require 'utils.info_default'()
default.incompatibles['exotic-industries'] = nil

return {
  name = 'DangerOres/ExoticIndustries',
  ID = 'do:ei',
  dependencies = {
    ['exotic-industries'] = true,
  },
  compatibles = {},
  incompatibles = default.incompatibles
}
