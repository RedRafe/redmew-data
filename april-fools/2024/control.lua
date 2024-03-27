if not ControlLoader.enabled('af:24') then return end

local handler = require '__core__.lualib.event_handler'

handler.add_libraries{
  require 'scripts.camera',
  require 'scripts.teleport',
  require 'scripts.tunnel',
}