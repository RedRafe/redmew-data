local default = require 'utils.info_default'()

local py_set = require 'mod-sets'['PyFE']
for _, name in pairs(py_set.mods) do
  default.incompatibles[name] = nil
end

return {
  name = 'DangerOres/Pyanodon',
  ID = 'do:py',
  dependencies = {
    ['pycoalprocessing'] = true,
    ['pycoalprocessinggraphics'] = true,
    ['pyindustry'] = true,
    ['pypostprocessing'] = true
  },
  compatibles = {
    ['pyfusionenergy'] = true,
    ['pyfusionenergygraphics'] = true,
  },
  incompatibles = default.incompatibles
}
