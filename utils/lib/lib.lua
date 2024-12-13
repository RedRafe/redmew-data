_G.redmew = {}

require 'utils.lib.palette'
require 'utils.lib.string'
require 'utils.lib.table'
require 'utils.lib.loader'

if data and data.raw and not data.raw.item then
  redmew.stage = 'settings'
  require 'utils.lib.settings'
elseif data and data.raw then
  redmew.stage = 'data'
  require 'utils.lib.data'
elseif script then
  redmew.stage = 'control'
  require 'utils.lib.control'
else
  error('Could not determine load order stage.')
end
