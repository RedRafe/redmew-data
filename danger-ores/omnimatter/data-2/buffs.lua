data.raw['technology']['toolbelt'].effects[1].modifier = 40

for _, armor in pairs(data.raw.armor) do
  if armor.inventory_size_bonus then
    armor.inventory_size_bonus = 20 + armor.inventory_size_bonus
  end
end