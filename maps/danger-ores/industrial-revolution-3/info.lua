local default = require 'utils.info_default'
default.incompatibles['IndustrialRevolution3'] = nil

return {
  name = 'DangerOres/IndustrialRevolution3',
  ID = 'do:ir3',
  dependencies = {
    ['IndustrialRevolution3'] = true,
    ['IndustrialRevolution3Assets1'] = true,
    ['IndustrialRevolution3Assets2'] = true,
    ['IndustrialRevolution3Assets3'] = true,
    ['IndustrialRevolution3Assets4'] = true,
  },
  compatibles = {
    ['IndustrialRevolution3LoadersStacking'] = true,
    ['DeadlockBlackRubberBelts'] = true,
  },
  incompatibles = default.incompatibles
}
