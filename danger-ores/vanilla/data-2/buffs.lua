data.raw['cargo-wagon']['cargo-wagon'].inventory_size = 400

data.raw['technology']['nuclear-power'].unit.count = 400
data.raw['technology']['toolbelt'].effects[1].modifier = 40

data.raw['armor']['modular-armor'].inventory_size_bonus = 20
data.raw['armor']['power-armor'].inventory_size_bonus = 40
data.raw['armor']['power-armor-mk2'].inventory_size_bonus = 60

for _, resource_name in pairs({"iron-ore", "copper-ore", "coal", "stone"}) do
    data.raw["resource"][resource_name].resource_patch_search_radius = 0
end

data.raw["transport-belt"]["express-transport-belt"].speed = 0.125
data.raw["underground-belt"]["express-underground-belt"].speed = 0.125
data.raw["splitter"]["express-splitter"].speed = 0.125
data.raw["loader"]["express-loader"].speed = 0.125
