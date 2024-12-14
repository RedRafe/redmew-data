local default = require 'utils.info_default'()
default.incompatibles['omnilib'] = nil
default.incompatibles['omnimatter_move'] = true

return {
  name = 'DangerOres/Omnimatter',
  ID = 'do:omni',
  dependencies = {
    ['omnimatter'] = true,
    ['omnilib'] = true,
  },
  compatibles = {
    ['omnimatter_compression'] = true,
    ['omnimatter_permutation'] = true,
    ['omnimatter_science'] = true,
    ['omnimatter_crystal'] = true,
    ['omnimatter_energy'] = true,
    ['omnimatter_fluid'] = true,
    ['omnimatter_water'] = true,
    ['omnimatter_wood'] = true,
    
  },
  incompatibles = default.incompatibles
}
