if not mods['deadlock-beltboxes-loaders'] then return end

local deadlock = _G.deadlock
if not deadlock then return end

local T1 = "deadlock-stacking-1"
local T2 = "deadlock-stacking-2"
local T3 = "deadlock-stacking-3"

local ore_stack_size = settings.startup["do:vanilla:ore_stack_size"].value or 10
for _, resource_name in pairs({"iron-ore", "copper-ore"}) do
  data.raw.item[resource_name].stack_size = ore_stack_size
end

deadlock.add_stack("pipe", nil, T1, 64)
deadlock.add_stack("engine-unit", nil, T2, 64)
deadlock.add_stack("speed-module", nil, T3, 64, "module")
deadlock.add_stack("electric-engine-unit", nil, T3, 64)
deadlock.add_stack("flying-robot-frame", nil, T3, 64)
deadlock.add_stack("low-density-structure", nil, T3, 64)
deadlock.add_stack("rocket-control-unit", nil, T3, 64)
deadlock.add_stack("rocket-fuel", nil, T3, 64)
deadlock.add_stack("transport-belt", nil, T1, 64)
deadlock.add_stack("inserter", nil, T1, 64)
deadlock.add_stack("piercing-rounds-magazine", nil, T2, 64, "ammo")
deadlock.add_stack("grenade", nil, T2, 64, "capsule")
deadlock.add_stack("stone-wall", nil, T2, 64)
deadlock.add_stack("rail", nil, T3, 64, "rail-planner")
deadlock.add_stack("electric-furnace", nil, T3, 64)
deadlock.add_stack("productivity-module", nil, T3, 64, "module")
deadlock.add_stack("automation-science-pack", nil, T1, 64, "tool")
deadlock.add_stack("logistic-science-pack", nil, T1, 64, "tool")
deadlock.add_stack("military-science-pack", nil, T2, 64, "tool")
deadlock.add_stack("chemical-science-pack", nil, T2, 64, "tool")
deadlock.add_stack("production-science-pack", nil, T3, 64, "tool")
deadlock.add_stack("utility-science-pack", nil, T3, 64, "tool")
deadlock.add_stack("space-science-pack", nil, T3, 64, "tool")

for _, item in pairs({"iron-gear-wheel", "copper-cable", "electronic-circuit"}) do
  deadlock.add_stack(
    item,
    string.format("__deadlock-beltboxes-loaders__/graphics/icons/square/stacked-%s.png", item),
    string.format("deadlock-stacking-%d", 1),
    32)
end

data.raw["loader-1x1"]["express-transport-belt-loader"].speed = 0.125
data.raw["furnace"]["express-transport-belt-beltbox"].crafting_speed = 0.125 * 32

require 'stacked-recipes'
