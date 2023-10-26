local Loader = {}
local package_list = require '__redmew-data__.package-list'

function Loader.startup()
  Loader.packages = package_list
  Loader.permissions = {}

  for __, data in pairs(Loader.packages) do
    local d = true
    for name, v in pairs(data.dependencies or {}) do
      d = d and (mods[name] ~= nil)
    end
    local i = false
    for name, v in pairs(data.incompatibles or {}) do
      i = i or (mods[name] ~= nil)
    end
    Loader.permissions[data.ID] = d and not i
  end
  log(serpent.block({'Enabled packages:', Loader.permissions }))
end

function Loader.init()
  Loader.packages = {}
  Loader.permissions = {}

  for id, data in pairs(Loader.packages) do
    local d = true
    for name, v in pairs(data.dependencies or {}) do
      d = d and (script.active_mods[name] ~= nil)
    end
    local i = false
    for name, v in pairs(data.incompatibles or {}) do
      i = i or (script.active_mods[name] ~= nil)
    end
    Loader.permissions[data.ID] = d and not i
  end
end

function Loader.enabled(ID)
  return Loader.permissions[ID] or false
end

function Loader.root_enabled(root_ID)
  for ID, package in pairs(Loader.permissions) do
    if package and package == true then
      if redmew.string.startsWith(ID, root_ID) then return true end
    end
  end
  return false
end

return Loader
