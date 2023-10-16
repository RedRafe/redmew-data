if not settings.startup['k2-danger-ores:bonus_inventory'].value then return end

--=================================================================================================

data.raw['cargo-wagon']['cargo-wagon'].inventory_size = 400
data.raw['technology']['toolbelt'].effects[1].modifier = 40
data.raw['armor']['modular-armor'].inventory_size_bonus = 20
data.raw['armor']['power-armor'].inventory_size_bonus = 40
data.raw['armor']['power-armor-mk2'].inventory_size_bonus = 60
data.raw['armor']['power-armor-mk3'].inventory_size_bonus = 80
data.raw['armor']['power-armor-mk4'].inventory_size_bonus = 100