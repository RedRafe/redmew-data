--- Science rebalance
-- Red/Green
redmew.replace_ingredient('automation-science-pack', 'copper-plate', 'copper-plate', 6)

-- Military/Blue
redmew.replace_ingredient('firearm-magazine', 'iron-plate', 'iron-plate', 2)
redmew.replace_ingredient('piercing-rounds-magazine', 'copper-plate', 'copper-plate', 8)
redmew.replace_ingredient('chemical-science-pack', 'engine-unit', 'engine-unit', 1)
redmew.replace_ingredient('chemical-science-pack', 'sulfur', 'sulfur', 2)
redmew.replace_ingredient('chemical-science-pack', 'advanced-circuit', 'advanced-circuit', 4)

-- Purple/Yellow/Space
redmew.replace_ingredient('satellite', 'accumulator', 'accumulator', 50)
redmew.replace_ingredient('satellite', 'solar-panel', 'solar-panel', 50)

--- Solar rebalance
-- 1. increase copper input ratios
redmew.replace_ingredient('solar-panel', 'copper-plate', 'copper-plate', 20)
redmew.replace_ingredient('solar-panel', 'steel-plate', 'steel-plate', 8)
redmew.replace_ingredient('solar-panel', 'electronic-circuit', 'electronic-circuit', 20)
redmew.replace_ingredient('accumulator', 'iron-plate', 'copper-plate', 12)

-- 2. increase power density (2x)
local solar_panel = data.raw['solar-panel']['solar-panel']
solar_panel.production = redmew.string.msv(solar_panel.production, 2)

local accumulator = data.raw['accumulator']['accumulator'].energy_source
accumulator.buffer_capacity = redmew.string.msv(accumulator.buffer_capacity, 2)
accumulator.input_flow_limit = redmew.string.msv(accumulator.input_flow_limit, 2)
accumulator.output_flow_limit = redmew.string.msv(accumulator.output_flow_limit, 2)
