local Loader = {}
local package_list = require '__redmew-data__.package-list'

local scenario_ID_list = {
  ['vanilla']     = 'va:',
  ['danger-ores'] = 'do:',
  ['crash-site']  = 'cs:',
  ['warmonger']   = 'wm:',
  ['april-fools'] = 'af:',
  ['frontier']    = 'fr:',
}

local function get_scenario_ID()
  if settings and settings.startup['redmew:scenario'] then
    return scenario_ID_list[settings.startup['redmew:scenario'].value]
  end
  return false
end

-- Data stages
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

-- Control stage
function Loader.init()
  Loader.packages = package_list
  Loader.permissions = {}
  local scenario_ID = get_scenario_ID()

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
    local s = true
    if scenario_ID then
      s = redmew.string.startsWith(data.ID, scenario_ID)
    end
    Loader.permissions[data.ID] = d and (not i) and s
  end
  log(serpent.block({'Enabled packages:', Loader.permissions }))
end

function Loader.enabled(ID)
  return Loader.permissions[ID] or false
end

function Loader.root_enabled(root_ID)
  return (get_scenario_ID() == root_ID) or false
end

return Loader
