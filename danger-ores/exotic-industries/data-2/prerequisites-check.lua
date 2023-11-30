for tech, _ in pairs(data.raw.technology) do
  redmew.remove_prerequisite(tech, 'mining-productivity-1')
  redmew.remove_prerequisite(tech, 'mining-productivity-2')
  redmew.remove_prerequisite(tech, 'mining-productivity-3')
  redmew.remove_prerequisite(tech, 'mining-productivity-4')
end