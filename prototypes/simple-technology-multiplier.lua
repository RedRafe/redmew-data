if not settings.startup['redmew_simple_technology_multiplier'].value then
  return
end

for _, t in pairs(data.raw.technology) do
  if t.max_level and t.max_level == 'infinite' then
    t.ignore_tech_cost_multiplier = true
  end
end
