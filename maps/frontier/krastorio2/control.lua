if not redmew.loader.enabled('fr:k2') then return end

local handler = require '__core__.lualib.event_handler'

handler.add_libraries{
  require 'scripts.creep',
  require 'scripts.intergalactic-transceiver'
}