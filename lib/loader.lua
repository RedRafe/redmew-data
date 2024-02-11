local Loader = {}
local package_list = require '__redmew-data__.package-list'

local scenario_ID_list = {
  ['danger-ores'] = 'do:',
  ['crash-site']  = 'cs:',
  ['warmonger']   = 'wm:',
  ['april-fools'] = 'af:',
}

local function get_scenario_ID()
  if settings and settings.startup['redmew:scenario'] then
    return scenario_ID_list[settings.startup['redmew:scenario'].value]
  end
  return false
end

function Loader.startup()
  Loader.packages = package_list
  Loader.permissions = {}
  local scenario_ID = get_scenario_ID()

  for __, data in pairs(Loader.packages) do
    -- Check dependency
    local d = true
    for name, v in pairs(data.dependencies or {}) do
      d = d and (mods[name] ~= nil)
    end
    -- Check incompatibilities
    local i = false
    for name, v in pairs(data.incompatibles or {}) do
      i = i or (mods[name] ~= nil)
    end
    -- Check scenario
    local s = true
    if scenario_ID then
      s = redmew.string.startsWith(data.ID, scenario_ID)
    end
    Loader.permissions[data.ID] = d and (not i) and s
  end
  log(serpent.block({'Enabled packages:', Loader.permissions }))
end

function Loader.init()
  Loader.packages = {}
  Loader.permissions = {}
  local scenario_ID = scenario_ID_list[settings.startup['redmew:scenario'].value]

  for id, data in pairs(Loader.packages) do
    -- Check dependency
    local d = true
    for name, v in pairs(data.dependencies or {}) do
      d = d and (script.active_mods[name] ~= nil)
    end
    -- Check incompatibilities
    local i = false
    for name, v in pairs(data.incompatibles or {}) do
      i = i or (script.active_mods[name] ~= nil)
    end
    -- Check scenario
    local s = redmew.string.startsWith(data.ID, scenario_ID)
    Loader.permissions[data.ID] = d and (not i) and s
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
