local removed_recipes = {
    'iron-ore-recycling',
    'copper-ore-recycling',
    'uranium-ore-recycling',
    'tungsten-ore-recycling',
    'holmium-ore-recycling',
    'coal-recycling',
    'stone-recycling',
    'calcite-recycling',
}

for _, name in pairs(removed_recipes) do
    data.raw.recipe[name] = nil
end

-- The recycler mod unlocks its auto-generated recycling recipes via
-- `unlock-recipe` effects on the `recycling` technology. Since those recipes
-- no longer exist, the dangling effects must be stripped or `assignID` fails.
local recycling_technology = data.raw.technology.recycling
if recycling_technology and recycling_technology.effects then
    local removed_lookup = {}
    for _, name in pairs(removed_recipes) do
        removed_lookup[name] = true
    end

    local kept_effects = {}
    for _, effect in pairs(recycling_technology.effects) do
        if not (effect.type == 'unlock-recipe' and removed_lookup[effect.recipe]) then
            table.insert(kept_effects, effect)
        end
    end
    recycling_technology.effects = kept_effects
end
