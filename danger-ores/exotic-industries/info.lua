local default = require '__redmew-data__.info-default'()
default.incompatibles["exotic-industries"] = nil

return {
  name = "DangerOres/ExoticIndustries",
  ID = "do:ei",
  dependencies = {
    ["exotic-industries"] = true,
  },
  compatibles = {},
  incompatibles = default.incompatibles
}
