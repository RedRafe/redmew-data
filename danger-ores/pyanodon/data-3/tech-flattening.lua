if not settings.startup['do_py_flatten_technology_cost'].value then return end

local function flatten_cost(tech)
  if not (tech and tech.unit and tech.unit.ingredients) then
    return
  end
  for _, ingredient in pairs(tech.unit.ingredients) do
    if ingredient[2] then ingredient[2] = 1 end
    if ingredient.amount then ingredient.amount = 1 end
  end
end

for _, tech in pairs(data.raw.technology) do
  flatten_cost(tech)
  flatten_cost(tech.normal)
  flatten_cost(tech.expensive)
end