local default = require '__redmew-data__.info-default'()

default.incompatibles['zombiesextended-core'] = nil

return {
  name = 'Frontier/ZombiesExtended',
  ID = 'fr:ze',
  dependencies = {
    ['zombiesextended-core'] = true,
  },
  compatibles = {},
  incompatibles = default.incompatibles
}
