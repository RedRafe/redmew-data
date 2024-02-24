local robot_energy_multipler = settings.startup['do:robot_energy_multipler'].value or 1

if settings.startup['do:robot_energy_multipler_include_construction_robots'].value then
  redmew.expensive_robot('construction-robot', robot_energy_multipler)
  redmew.expensive_robot('roboport-equipment', robot_energy_multipler)
end

redmew.expensive_robot('roboport', robot_energy_multipler)
redmew.expensive_robot('logistic-robot', robot_energy_multipler)
