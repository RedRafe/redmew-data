local default = require '__redmew-data__.info-default'()
default.incompatibles['scrap-resource'] = nil

return {
  name = 'DangerOres/Scrap',
  ID = 'do:scrap',
  dependencies = {
    ['scrap-resource'] = true,
    ['reverse-factory'] = true,
  },
  incompatibles = default.incompatibles
}
