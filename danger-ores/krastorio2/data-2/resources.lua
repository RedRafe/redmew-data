data.raw.resource["uranium-ore"].minable =
{
    mining_particle = "stone-particle",
    mining_time = 1,
    result = "uranium-ore"
}

data.raw.resource["rare-metals"].minable =
{
    mining_particle = "stone-particle",
    mining_time = 1,
    result = "compact-raw-rare-metals"
}

for ___, name in pairs({"iron-ore", "copper-ore", "coal", "stone", "rare-metals", "uranium-ore"}) do
    data.raw.resource[name].resource_patch_search_radius = 0
end