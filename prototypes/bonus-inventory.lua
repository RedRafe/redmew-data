data.raw.technology.toolbelt.effects[1].modifier = data.raw.technology.toolbelt.effects[1].modifier + 30

for _, armor in pairs(data.raw.armor) do
    if armor.inventory_size_bonus then
        armor.inventory_size_bonus = armor.inventory_size_bonus + 20
    end
end