local default = require 'utils.info_default'()
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
