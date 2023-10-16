if settings.startup['k2-danger-ores:win_condition'].value == 0 then return end

local LAB_PRODUCTIVITY = 1.4
local ASSEMBLER_PRODUCTIVITY = 1.4
local ROCKET_LAUNCHES = settings.startup['k2-danger-ores:win_condition'].value or 1000
local SPACE_DATA_PER_ROCKET = 2000

local tech = data.raw.technology['kr-intergalactic-transceiver']

tech.unit.count = ROCKET_LAUNCHES * SPACE_DATA_PER_ROCKET * ASSEMBLER_PRODUCTIVITY * LAB_PRODUCTIVITY
tech.ignore_tech_cost_multiplier = true
