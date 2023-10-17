return

-- deprecated feature

for prefix, speed in pairs({
  [""] = 1,
  ["fast-"] = 2,
  ["express-"] = 4,
  ["kr-advanced-"] = 8,
  ["kr-superior-"] = 16,
}) do
  data.raw["transport-belt"][prefix .. "transport-belt"].speed = 0.03125 * speed
  data.raw["underground-belt"][prefix .. "underground-belt"].speed = 0.03125 * speed
  data.raw["splitter"][prefix .. "splitter"].speed = 0.03125 * speed
end

data.raw["loader-1x1"]["kr-loader"].speed = 0.03125 * 1
data.raw["loader-1x1"]["kr-fast-loader"].speed = 0.03125 * 2
data.raw["loader-1x1"]["kr-express-loader"].speed = 0.03125 * 4
data.raw["loader-1x1"]["kr-advanced-loader"].speed = 0.03125 * 8
data.raw["loader-1x1"]["kr-superior-loader"].speed = 0.03125 * 16

-- apply speed bonuses to beltboxes
if mods["deadlock-beltboxes-loaders"] then
  data.raw["furnace"]["express-transport-belt-beltbox"].crafting_speed = 0.03125 * 4 * 32
  data.raw["furnace"]["kr-advanced-transport-belt-beltbox"].crafting_speed = 0.03125 * 8 * 32
  data.raw["furnace"]["kr-superior-transport-belt-beltbox"].crafting_speed = 0.03125 * 16 * 32
end