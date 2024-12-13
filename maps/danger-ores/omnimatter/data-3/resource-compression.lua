-- Remove ore patches compression
-- Players could delete patches by selecting small chunks to be compressed

local resources = {
  'compressed-resource-omnite',
  'compressed-resource-infinite-omnite',
}

for _, name in pairs(resources) do
  local res = data.raw.resource[name]
  if res then data.raw.resource[name] = nil end
end