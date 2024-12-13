local fr1 = redmew.config['do:bronze-forestry']
local fr2 = redmew.config['do:iron-forestry']
local fr3 = redmew.config['do:chrome-forestry']

-- Make new entities
data:extend{
  redmew.make_tier(fr1),
  redmew.make_tier(fr2),
  redmew.make_tier(fr3),
}


-- Replace item back
data.raw['assembling-machine'][fr1.name].minable.result = fr1._base
data.raw['assembling-machine'][fr2.name].minable.result = fr2._base
data.raw['assembling-machine'][fr3.name].minable.result = fr3._base

-- Replace placeable item
data.raw.item[fr1._base].place_result = fr1.name
data.raw.item[fr2._base].place_result = fr2.name
data.raw.item[fr3._base].place_result = fr3.name