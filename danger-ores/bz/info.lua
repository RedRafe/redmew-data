local default = require '__redmew-data__.info-default'()

default.incompatibles["bzaluminum"] = nil
default.incompatibles["bzcarbon"] = nil
default.incompatibles["bzchlorine"] = nil
default.incompatibles["bzfoundry"] = nil
default.incompatibles["bzgas"] = nil
default.incompatibles["bzgold"] = nil
default.incompatibles["bzlead"] = nil
default.incompatibles["bzsilicon"] = nil
default.incompatibles["bztin"] = nil
default.incompatibles["bztitanium"] = nil
default.incompatibles["bztungsten"] = nil
default.incompatibles["bzzirconium"] = nil

return {
  name = "DangerOres/BZ",
  ID = "do:bz",
  dependencies = {
    ["bzcarbon"] = true,
    ["bzgas"] = true,
    ["bzgold"] = true,
    ["bztitanium"] = true,
    ["bztungsten"] = true,
  },
  compatibles = {
    ["bzaluminum"] = true,
    ["bzchlorine"] = true,
    ["bzfoundry"] = true,
    ["bzlead"] = true,
    ["bzsilicon"] = true,
    ["bztin"] = true,
    ["bzzirconium"] = true,
  },
  incompatibles = default.incompatibles
}
