data.raw.character.character.inventory_size = 20 + data.raw.character.character.inventory_size

for _, armor in pairs(data.raw.armor) do
  if armor.inventory_size_bonus then
    armor.inventory_size_bonus = 30 + armor.inventory_size_bonus
  end
end

