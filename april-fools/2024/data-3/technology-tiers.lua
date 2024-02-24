local spread_cost = true
local method = 'uniform' -- 'uniform', 'linear'
local tiers = 5
local prefix = 'rd-'
local _copy = table.deepcopy

local new_techs = {}

for _, technology_prototype in pairs(data.raw.techonology) do

  local tech = technology_prototype.normal or technology_prototype
  local cost = tech.unit.count

  if not cost then
    goto continue
  end

  local prerequisites = _copy(tech.prerequisites)
  local base_icon = tech.icons or { tech.icon }
  local individual_cost = spread_cost and (math.ceil(cost / tiers)) or cost
  local iterations = 0

  if method == 'uniform' then
    iterations = tiers
  elseif method == 'linear' then
    iterations = #tech.unit.ingredients
  end

  for i=1, iterations do
    local new_tech = _copy(tech)
    new_tech.name = prefix .. tostring(i) .. '-' .. tech.name
    new_tech.unit.cost = individual_cost

    if i < iterations then
      new_tech.prerequisites = { prefix .. tostring(i+1) .. '-' .. tech.name }
    end

    if i == 1 then
      -- original tech
    elseif i ~= iterations then
      -- middle tech
      new_tech.name = prefix .. tostring(i) .. '-' .. tech.name
      new_tech.localised_name = tech.localised_name
    else
      -- last tech
      new_tech.name = prefix .. tostring(i) .. '-' .. tech.name
      new_tech.localised_name = tech.localised_name
    end
  end

  ::continue::
end