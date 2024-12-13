local default = require 'utils.info_default'
default.incompatibles['scrap-resource'] = nil

return {
  name = 'DangerOres/Scrap',
  ID = 'do:scrap',
  dependencies = {
    ['scrap-resource'] = true,
    ['quality'] = true,
  },
  incompatibles = default.incompatibles
}
