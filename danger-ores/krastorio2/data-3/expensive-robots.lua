local robot_energy_multipler = settings.startup["do:k2:robot_energy_multipler"].value

if settings.startup['do:k2:robot_energy_multipler_include_construction_robots'].value then
    local construction_robot = data.raw["construction-robot"]["construction-robot"]
    construction_robot.max_energy = (robot_energy_multipler * 1.5) .. "MJ"
    construction_robot.energy_per_tick = (robot_energy_multipler * 0.05) .. "kJ"
    construction_robot.energy_per_move = (robot_energy_multipler * 5) .. "kJ"

    local roboport_equipment = data.raw["roboport-equipment"]["personal-roboport-equipment"]
    roboport_equipment.energy_source.buffer_capacity = (robot_energy_multipler * 35) .. "MJ"
    roboport_equipment.energy_source.input_flow_limit = (robot_energy_multipler * 3500) .. "KW"
    roboport_equipment.charging_energy = (robot_energy_multipler * 1000) .. "kW"

    local roboport_equipment2 = data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"]
    roboport_equipment2.energy_source.buffer_capacity = (robot_energy_multipler * 50) .. "MJ"
    roboport_equipment2.energy_source.input_flow_limit = (robot_energy_multipler * 5000) .. "KW"
    roboport_equipment2.charging_energy = (robot_energy_multipler * 2000) .. "kW"
end

local logistic_robot = data.raw["logistic-robot"]["logistic-robot"]
logistic_robot.max_energy = (robot_energy_multipler * 1.5) .. "MJ"
logistic_robot.energy_per_tick = (robot_energy_multipler * 0.05) .. "kJ"
logistic_robot.energy_per_move = (robot_energy_multipler * 5) .. "kJ"

local roboport = data.raw.roboport["roboport"]
roboport.energy_source.input_flow_limit = (robot_energy_multipler * 5) .. "MW"
roboport.energy_source.buffer_capacity = (robot_energy_multipler * 100) .. "MJ"
roboport.recharge_minimum = (robot_energy_multipler * 40) .. "MJ"
-- roboport.energy_usage = (robot_energy_multipler * 50) .. "kJ"
roboport.charging_energy = (robot_energy_multipler * 1000) .. "kW"

local large_roboport = data.raw.roboport["kr-large-roboport"]
large_roboport.energy_source.input_flow_limit = (robot_energy_multipler * 100) .. "MW"
large_roboport.energy_source.buffer_capacity = (robot_energy_multipler * 1) .. "GJ"
large_roboport.recharge_minimum = (robot_energy_multipler * 50) .. "MJ"
-- large_roboport.energy_usage = (robot_energy_multipler * 1) .. "MW"
large_roboport.charging_energy = (robot_energy_multipler * 5) .. "MW"

local small_roboport = data.raw.roboport["kr-large-roboport"]
small_roboport.energy_source.input_flow_limit = (robot_energy_multipler * 12) .. "MW"
small_roboport.energy_source.buffer_capacity = (robot_energy_multipler * 300) .. "MJ"
small_roboport.recharge_minimum = (robot_energy_multipler * 50) .. "MJ"
-- small_roboport.energy_usage = (robot_energy_multipler * 50) .. "kW"
small_roboport.charging_energy = (robot_energy_multipler * 3) .. "MW"