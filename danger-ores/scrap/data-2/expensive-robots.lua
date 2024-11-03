local robot_energy_multipler = settings.startup['do_robot_energy_multiplier'].value or 1

if settings.startup['do_robot_energy_multiplier_include_construction_robots'].value then
  redmew.expensive_robot('construction-robot', robot_energy_multipler)
  redmew.expensive_robot('roboport-equipment', robot_energy_multipler)
end

redmew.expensive_robot('roboport', robot_energy_multipler)
redmew.expensive_robot('logistic-robot', robot_energy_multipler)
