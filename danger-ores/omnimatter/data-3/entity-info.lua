local EW = redmew.string.endsWith

local function lr_hr_tint(obj, tint)
  if not obj then return end
  obj.tint = tint
  if obj.hr_version ~= nil then obj.hr_version.tint = tint end
end

local function tint_layers(obj, tint)
  if not obj then return end
  if obj.filename then lr_hr_tint(obj, tint) end
  if obj.layers and obj.layers[1] then lr_hr_tint(obj.layers[1], tint) end
  for _, d in pairs({'north', 'east', 'south', 'west'}) do tint_layers(obj[d], tint) end
end

function apply_tint(obj, tint)
  if not obj or not tint or type(obj) ~= 'table' then return end
  tint_layers(obj.animation, tint)
  tint_layers(obj.horizontal_animation, tint)
  tint_layers(obj.vertical_animation, tint)
  tint_layers(obj.structure, tint)
  tint_layers(obj.patch, tint)
  tint_layers(obj.picture, tint)
  if obj.graphics_set then tint_layers(obj.graphics_set.animation, tint) end
  if obj.wet_mining_graphics_set then tint_layers(obj.wet_mining_graphics_set.animation, tint) end
  for _, fb in pairs(obj.fluid_boxes or {}) do 
    if type(fb) == 'table' then tint_layers(fb.pipe_picture, tint) end
  end
  for _, wv in pairs(obj.working_visualisations or {}) do tint_layers(wv.animation, tint) end
end

local COLOR_SCHEME = {
  ['default']     = nil,
  ['compact']     = {r = 255 / 255, g = 255 / 255, b =   0 / 255, a = 0.8}, -- Yellow
  ['nanite']      = {r = 220 / 255, g =  20 / 255, b =  60 / 255, a = 0.8}, -- Red
  ['quantum']     = {r =   0 / 255, g = 128 / 255, b = 128 / 255, a = 0.8}, -- Blue
  ['singularity'] = {r = 255 / 255, g =  20 / 255, b = 147 / 255, a = 0.8}, -- Pink
}

local function select_tint_from_name(name)
  local tier = "default"
  if EW(name, '-compressed-compact') then tier = 'compact' end
  if EW(name, '-compressed-nanite') then tier = 'nanite' end
  if EW(name, '-compressed-quantum') then tier = 'quantum' end
  if EW(name, '-compressed-singularity') then tier = 'singularity' end
  return COLOR_SCHEME[tier]
end

for _, source in pairs({
  'assembling-machine',
  'boiler',
  'furnace',
  'generator',
  'lab',
  'mining-drill',
  'radar',
  'rocket-silo',
}) do
  for __, entity in pairs(data.raw[source]) do
    local tint = select_tint_from_name(entity.name)
    if tint then apply_tint(entity, tint) end
  end
end