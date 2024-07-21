data.raw.technology.toolbelt.effects[1].modifier = 40

for _, armor in pairs(data.raw.armor) do
  if armor.inventory_size_bonus then
    armor.inventory_size_bonus = 20 + armor.inventory_size_bonus
  end
end

data.raw['transport-belt']['express-transport-belt'].speed = 0.125
data.raw['underground-belt']['express-underground-belt'].speed = 0.125
data.raw['splitter']['express-splitter'].speed = 0.125
data.raw['loader']['express-loader'].speed = 0.125
if mods ['aai-loaders'] then
  data.raw['loader-1x1']['aai-express-loader'].speed = 0.125
end
