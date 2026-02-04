if not settings.startup['redmew_robot_energy_multiplier'].value then
    return
end

local cost_multiplier = 10
redmew.expensive_robot('construction-robot', cost_multiplier)
redmew.expensive_robot('roboport-equipment', cost_multiplier)
redmew.expensive_robot('roboport',           cost_multiplier)
redmew.expensive_robot('logistic-robot',     cost_multiplier)
