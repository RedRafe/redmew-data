if not redmew.loader.enabled('do:vanilla') then return end

redmew.config = require 'config'

require 'data-1.assembling-machine'
require 'data-1.braking-force'
require 'data-1.chemical'
require 'data-1.electric-furnace'
require 'data-1.mining-drills'
require 'data-1.nuclear'
require 'data-1.steam'
require 'data-1.worker-robot-storage'

require 'prototypes.advanced-coal-liquefaction'
require 'prototypes.stone-to-uranium'
