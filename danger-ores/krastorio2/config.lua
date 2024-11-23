local RED      = {r = 216 / 255, g =  24 / 255, b =   3 / 255, a = 0.8}
local BLUE     = {r =   5 / 255, g = 164 / 255, b = 208 / 255, a = 0.8}
local PURPLE   = {r =  75 / 255, g =   0 / 255, b = 130 / 255, a = 0.8}
local YELLOW   = {r = 255 / 255, g = 255 / 255, b =   0 / 255, a = 0.8}
local AQUA     = {r = 127 / 255, g = 255 / 255, b = 212 / 255, a = 0.8}
local LAVENDER = {r = 147 / 255, g = 112 / 255, b = 219 / 255, a = 0.8}
local CRIMSON  = {r = 220 / 255, g =  20 / 255, b =  60 / 255, a = 0.8}
local TEAL     = {r =   0 / 255, g = 128 / 255, b = 128 / 255, a = 0.8}
-- choosing the best tints for blind players too
local COLOR_MK2 = TEAL
local COLOR_Mk3 = CRIMSON

return {
  ['assembling-machine-3'] = {
    name = 'assembling-machine-3',
    type = 'assembling-machine',
    next_upgrade = 'assembling-machine-4',
    fast_replaceable_group = 'assembling-machine',
    _technology = 'automation-3'
  },
  ['assembling-machine-4'] = {
    name = 'assembling-machine-4',
    type = 'assembling-machine',
    _base = 'assembling-machine-3',
    _tint = COLOR_Mk3,
    order = 'c1[assembling-machine-4]',
    crafting_speed = 2,
    energy_usage = '500kW',
    module_slots = 5,
    fast_replaceable_group = 'assembling-machine',
    energy_source = { emissions_per_minute = { pollution  = 5 } },
    _technology = 'automation-4',
  },
  ['kr-advanced-assembling-machine'] = {
    name = 'kr-advanced-assembling-machine',
    type = 'assembling-machine',
    module_slots = 6,
    _technology = 'kr-automation',
  },
  ['chemical-plant'] = {
    name = 'chemical-plant',
    type = 'assembling-machine',
    fast_replaceable_group = 'chemical-plant',
    next_upgrade = 'chemical-plant-2',
  },
  ['chemical-plant-2'] = {
    name = 'chemical-plant-2',
    type = 'assembling-machine',
    _base = 'chemical-plant',
    _tint = COLOR_MK2,
    crafting_speed = 2,
    energy_usage = '420kW',
    module_slots = 5,
    fast_replaceable_group = 'chemical-plant',
    energy_source = { emissions_per_minute = { pollution  = 10 } },
  },
  ['kr-advanced-chemical-plant'] = {
    name = 'kr-advanced-chemical-plant',
    type = 'assembling-machine',
    module_slots = 6,
  },
  ['oil-refinery'] = {
    name = 'oil-refinery',
    type = 'assembling-machine',
    fast_replaceable_group = 'oil-refinery',
    next_upgrade = 'oil-refinery-2'
  },
  ['oil-refinery-2'] = {
    name = 'oil-refinery-2',
    type = 'assembling-machine',
    _base = 'oil-refinery',
    _tint = COLOR_MK2,
    crafting_speed = 2,
    energy_usage = '840kW',
    module_slots = 4,
    fast_replaceable_group = 'oil-refinery',
    next_upgrade = 'oil-refinery-3',
    energy_source = { emissions_per_minute = { pollution  = 15 } },
  },
  ['oil-refinery-3'] = {
    name = 'oil-refinery-3',
    type = 'assembling-machine',
    _base = 'oil-refinery',
    _tint = COLOR_Mk3,
    crafting_speed = 8,
    energy_usage = '1600kW',
    module_slots = 6,
    fast_replaceable_group = 'oil-refinery',
    energy_source = { emissions_per_minute = { pollution  = 60 } },
    _technology = 'kr-advanced-chemical-plant'
  },
  ['kr-electrolysis-plant'] = {
    name = 'kr-electrolysis-plant',
    type = 'assembling-machine',
    fast_replaceable_group = 'kr-electrolysis-plant',
    next_upgrade = 'kr-electrolysis-plant-2'
  },
  ['kr-electrolysis-plant-2'] = {
    name = 'kr-electrolysis-plant-2',
    type = 'assembling-machine',
    _base = 'kr-electrolysis-plant',
    _tint = COLOR_Mk3,
    crafting_speed = 4,
    energy_usage = '1940kW',
    module_slots = 4,
    fast_replaceable_group = 'kr-electrolysis-plant',
    energy_source = { emissions_per_minute = { pollution  = 2.5 } },
    _technology = 'kr-advanced-chemical-plant'
  },
  ['electric-furnace'] = {
    name = 'electric-furnace',
    type = 'assembling-machine',
    fast_replaceable_group = 'electric-furnace',
    next_upgrade = 'electric-furnace-2',
  },
  ['electric-furnace-2'] = {
    name = 'electric-furnace-2',
    type = 'assembling-machine',
    _base = 'electric-furnace',
    _tint = COLOR_MK2,
    crafting_speed = 4,
    energy_usage = '905kW',
    module_slots = 3,
    fast_replaceable_group = 'electric-furnace',
    energy_source = { emissions_per_minute = { pollution  = 2.5 } },
    _technology = 'advanced-material-processing-3'
  },
  ['kr-advanced-furnace'] = {
    name = 'kr-advanced-furnace',
    type = 'assembling-machine',
    _technology = 'kr-advanced-furnace'
  },
  ['electric-mining-drill'] = {
    name = 'electric-mining-drill',
    type = 'mining-drill',
    fast_replaceable_group = 'electric-mining-drill',
    next_upgrade = 'electric-mining-drill-2',
    _technology = 'kr-electric-mining-drill'
  },
  ['electric-mining-drill-2'] = {
    name = 'electric-mining-drill-2',
    type = 'mining-drill',
    _base = 'electric-mining-drill',
    _tint = COLOR_MK2,
    localised_name = { 'do:k2.electric-mining-drill-2' },
    mining_speed = 1,
    energy_usage = '250kW',
    module_slots = 2,
    fast_replaceable_group = 'electric-mining-drill',
    energy_source = { emissions_per_minute = { pollution  = 22.5 } },
    next_upgrade = 'kr-electric-mining-drill-mk2',
    resource_searching_radius = 3.49
  },
  ['kr-electric-mining-drill-mk2'] = {
    name = 'kr-electric-mining-drill-mk2',
    type = 'mining-drill',
    mining_speed = 2,
    energy_usage = '625kW',
    fast_replaceable_group = 'electric-mining-drill',
    next_upgrade = 'electric-mining-drill-3',
    energy_source = { emissions_per_minute = { pollution  = 45 } },
    _technology = 'kr-electric-mining-drill-mk2',
  },
  ['electric-mining-drill-3'] = {
    name = 'electric-mining-drill-3',
    type = 'mining-drill',
    _base = 'electric-mining-drill',
    _tint = COLOR_Mk3,
    localised_name = { 'do:k2.electric-mining-drill-3' },
    mining_speed = 3,
    energy_usage = '940kW',
    module_slots = 3,
    fast_replaceable_group = 'electric-mining-drill',
    next_upgrade = 'kr-electric-mining-drill-mk3',
    energy_source = { emissions_per_minute = { pollution  = 67.5 } },
    resource_searching_radius = 4.49,
  },
  ['kr-electric-mining-drill-mk3'] = {
    name = 'kr-electric-mining-drill-mk3',
    type = 'mining-drill',
    mining_speed = 4,
    energy_usage = '1560kW',
    fast_replaceable_group = 'electric-mining-drill',
    energy_source = { emissions_per_minute = { pollution  = 90 } },
    _technology = 'kr-electric-mining-drill-mk3',
  },
  ['nuclear-reactor'] = {
    name = 'nuclear-reactor',
    type = 'reactor',
    fast_replaceable_group = 'nuclear-reactor',
    next_upgrade = 'nuclear-reactor-2',
  },
  ['nuclear-reactor-2'] = {
    name = 'nuclear-reactor-2',
    type = 'reactor',
    _base = 'nuclear-reactor',
    _tint = COLOR_MK2,
    consumption = '500MW',
    fast_replaceable_group = 'nuclear-reactor',
    heat_buffer = {
      max_temperature = 1000,
      max_transfer = '200GW',
      minimum_glow_temperature = 350,
      specific_heat = '100MJ'
    }
  },
  ['heat-exchanger'] = {
    name = 'heat-exchanger',
    type = 'boiler',
    fast_replaceable_group = 'heat-exchanger',
    next_upgrade =  'heat-exchanger-2',
  },
  ['heat-exchanger-2'] = {
    name = 'heat-exchanger-2',
    type = 'boiler',
    _base = 'heat-exchanger',
    _tint = COLOR_MK2,
    fast_replaceable_group = 'heat-exchanger',
    energy_consumption = '100MW',
    target_temperature = 815,
    energy_source = {
      max_temperature = 1000,
      max_transfer = '20GW',
      min_working_temperature = 815,
      minimum_glow_temperature = 350,
      specific_heat = '10MJ',
    }
  },
  ['steam-turbine'] = {
    name = 'steam-turbine',
    type = 'generator',
    fast_replaceable_group = 'steam-engine',
    next_upgrade =  'steam-turbine-2',
  },
  ['steam-turbine-2'] = {
    name = 'steam-turbine-2',
    type = 'generator',
    _base = 'steam-turbine',
    _tint = COLOR_MK2,
    fast_replaceable_group = 'steam-engine',
    max_power_output = '20MW',
    scale_fluid_usage = true,
    maximum_temperature = 815,
  },
  ['boiler'] = {
    name = 'boiler',
    type = 'boiler',
    fast_replaceable_group = 'boiler',
    next_upgrade =  'boiler-2',
  },
  ['boiler-2'] = {
    name = 'boiler-2',
    type = 'boiler',
    _base = 'boiler',
    _tint = COLOR_MK2,
    fast_replaceable_group = 'boiler',
    energy_consumption = '3MW',
    target_temperature = 315,
    energy_source = { emissions_per_minute = { pollution  = 50 } },
  },
  ['steam-engine'] = {
    name = 'steam-engine',
    type = 'generator',
    fast_replaceable_group = 'steam-engine',
    next_upgrade =  'steam-engine-2',
  },
  ['steam-engine-2'] = {
    name = 'steam-engine-2',
    type = 'generator',
    _base = 'steam-engine',
    _tint = COLOR_MK2,
    fast_replaceable_group = 'steam-engine',
    max_power_output = '1.5MW',
    scale_fluid_usage = true,
    maximum_temperature = 315,
  },
}
