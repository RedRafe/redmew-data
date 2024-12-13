local Public = {}
redmew.loader = Public

-- LOADER UTILS LIBRARY
-- ============================================================================
local config = require 'utils.config'

local function get_scenario_ID()
  if settings and settings.startup['redmew_scenario'] then
    return config.scenario_id[settings.startup['redmew_scenario'].value]
  end
  return false
end

Public.info_default = function()
  return table.deepcopy(config.info_default)
end

-- Data stages
Public.startup = function()
  Public.packages = config.package_list
  Public.permissions = {}
  local scenario_ID = get_scenario_ID()

  for __, data in pairs(Public.packages) do
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
      s = redmew.string.starts_with(data.ID, scenario_ID)
    end
    Public.permissions[data.ID] = d and (not i) and s
  end
  log(serpent.block({'Enabled packages:', Public.permissions }))
end

-- Control stage
Public.init = function()
  Public.packages = config.package_list
  Public.permissions = {}
  local scenario_ID = get_scenario_ID()

  for id, data in pairs(Public.packages) do
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
      s = redmew.string.starts_with(data.ID, scenario_ID)
    end
    Public.permissions[data.ID] = d and (not i) and s
  end
  log(serpent.block({'Enabled packages:', Public.permissions }))
end

Public.enabled = function(ID)
  return Public.permissions[ID] or false
end

Public.root_enabled = function(root_ID)
  return (get_scenario_ID() == root_ID) or false
end

