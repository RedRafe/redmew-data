local default = require 'utils.info_default'
default.incompatibles['Krastorio2'] = nil

return {
  name = 'Frontier/Krastorio2',
  ID = 'fr:k2',
  dependencies = {
    ['Krastorio2'] = true,
    ['Krastorio2Assets'] = true
  },
  compatibles = {},
  incompatibles = default.incompatibles
}
