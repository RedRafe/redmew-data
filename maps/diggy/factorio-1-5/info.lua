local default = require 'utils.info_default'()
default.incompatibles['factorio-1.5'] = nil
default.incompatibles['space-age'] = nil

return {
    name = 'Diggy/Factorio-1.5',
    ID = 'dy:f15',
    dependencies = {
        ['space-age'] = true,
        ['factorio-1.5'] = true,
    },
    compatibles = {},
    incompatibles = default.incompatibles,
}
