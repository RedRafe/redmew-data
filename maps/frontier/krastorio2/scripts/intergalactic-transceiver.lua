-- =================================================================================================
---@type ScriptLib
local Public = {}

Public.on_init = function()
  -- disable K2 victory condition
  if remote.interfaces['kr-intergalactic-transceiver'] and remote.interfaces['kr-intergalactic-transceiver']['set_no_victory'] then
    remote.call('kr-intergalactic-transceiver', 'set_no_victory', true)
  end
end

return Public
