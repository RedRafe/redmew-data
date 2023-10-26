local default = require '__redmew-data__.info-default'()

return {
  name = 'DangerOres/Vanilla',
  ID = 'do:vanilla',
  dependencies = {
  },
  compatibles = {
    ['deadlock-beltboxes-loaders'] = true
  },
  incompatibles = default.incompatibles
}
