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
  local res = data.raw.resource[name]
  if res then res.resource_patch_search_radius = 0 end
end

local stack_size = settings.startup['do:ore_stack_size'].value

if stack_size == 0 then return end

for ___, name in pairs({"iron-ore", "copper-ore", "coal", "stone", "rare-metals", "uranium-ore"}) do
  local item = data.raw.item[name]
  if item then item.stack_size = stack_size end
end