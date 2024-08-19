redmew = require '__redmew-data__.lib.control-util'
ControlLoader = require '__redmew-data__.lib.loader'
ControlLoader.init()

local handler = require '__core__.lualib.event_handler'

---@class ScriptLib
---@field add_commands? fun()
---@field add_remote_interface? fun()
---@field on_init? fun()
---@field on_load? fun()
---@field on_configuration_changed? fun(d: ConfigurationChangedData)
---@field events? table<defines.events, fun(d: EventData)>
---@field on_nth_tick? table<integer, fun(d: NthTickEventData)>

handler.add_libraries{
  require 'scripts.waterfill'
}

require 'april-fools.2024.control'
require 'frontier.krastorio2.control'
require 'danger-ores.krastorio2.control'
