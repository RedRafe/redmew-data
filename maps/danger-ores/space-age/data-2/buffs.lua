data.raw.technology.toolbelt.effects[1].modifier = 40

for _, armor in pairs(data.raw.armor) do
  if armor.inventory_size_bonus then
    armor.inventory_size_bonus = 20 + armor.inventory_size_bonus
  end
end

if data.raw['transport-belt']['express-transport-belt'] then
  local express_speed = 0.125
  data.raw['transport-belt']['express-transport-belt'].speed = express_speed
  data.raw['underground-belt']['express-underground-belt'].speed = express_speed
  data.raw['splitter']['express-splitter'].speed = express_speed
  data.raw['loader']['express-loader'].speed = express_speed
  
  if data.raw['loader-1x1']['aai-express-loader'] then
    data.raw['loader-1x1']['aai-express-loader'].speed = express_speed
  end
  if data.raw['loader-1x1']['express-transport-belt-loader'] then
    data.raw['loader-1x1']['express-transport-belt-loader'].speed = express_speed
  end
  if data.raw['furnace']['express-transport-belt-beltbox'] then
    data.raw['furnace']['express-transport-belt-beltbox'].crafting_speed = 4
  end
end

if data.raw['transport-belt']['turbo-transport-belt'] then
  local turbo_speed = 0.1875
  data.raw['transport-belt']['turbo-transport-belt'].speed = turbo_speed
  data.raw['underground-belt']['turbo-underground-belt'].speed = turbo_speed
  data.raw['splitter']['turbo-splitter'].speed = turbo_speed
  data.raw['loader']['turbo-loader'].speed = turbo_speed
  
  if data.raw['loader-1x1']['aai-turbo-loader'] then
    data.raw['loader-1x1']['aai-turbo-loader'].speed = turbo_speed
  end
  if data.raw['loader-1x1']['turbo-transport-belt-loader'] then
    data.raw['loader-1x1']['turbo-transport-belt-loader'].speed = turbo_speed
  end
  if data.raw['furnace']['turbo-transport-belt-beltbox'] then
    data.raw['furnace']['turbo-transport-belt-beltbox'].crafting_speed = 4
  end
end