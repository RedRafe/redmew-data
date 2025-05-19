local diggy_axe_names = {
    'Delver\'s Axe',
    'Miner\'s Edge',
    'Burrower\'s Tool',
    'Stone-Chipper',
    'Rocksplitter',
    'Ore-Hewer',
    'Tunnelbiter',
    'Pickmaster\'s Axe',
    'Deepdelver',
    'Stoneforged Axe',
    'Khazâd-Steel Axe',
    'Baraz-Angâz',
    'Hallsplitter',
    'Forgewarden\'s Blade',
    'Blackvein Axe',
    'Deepforge Axe',
    'Glimmeraxe',
    'Runekeeper\'s Axe',
    'Ironfist\'s Pride',
    'Mazal-Khurz',
    'Earthbreaker',
    'Gorun-Ang',
    'Vaultcarver',
    'Mithrilcleaver',
    'Durin\'s Hew',
    'Deepking\'s Axe',
    'Gilded Pickaxe',
    'Anvilcleaver',
    'Stonefather\'s Edge',
    'Goldvein Splitter',
    'Thrain\'s Pick',
    'Underdeep Axe',
    'Darkdelver',
    'Molten-Hewer',
    'Mountainbane',
    'Balin\'s Wrath',
    'Smokeforge Axe',
    'Echo-Hammer',
    'Dwarrowcleaver',
    'Thundering Hew',
    'Granitefang',
    'The Delver\'s Doom',
    'Glory of Nogrod',
    'Rockmaw',
    'Cave-Warden\'s Tool',
    'Starforged Axe',
    'Axe of the Seven Halls',
    'Hammerhand\'s Hew',
    'Azanulbizar Axe',
    'The Heart of the Mountain',
}

local function ingredients(tier)
    if tier <= 5 then
        return {
            { 'automation-science-pack', 1 },
            { 'logistic-science-pack', 1 },
        }
    elseif tier <= 10 then
        return {
            { 'automation-science-pack', 1 },
            { 'logistic-science-pack', 1 },
            { 'chemical-science-pack', 1 },
        }
    elseif tier <= 20 then
        return {
            { 'automation-science-pack', 1 },
            { 'logistic-science-pack', 1 },
            { 'military-science-pack', 1 },
            { 'chemical-science-pack', 1 },
            { 'production-science-pack', 1 },
        }
    else
        return {
            { 'automation-science-pack', 1 },
            { 'logistic-science-pack', 1 },
            { 'military-science-pack', 1 },
            { 'chemical-science-pack', 1 },
            { 'production-science-pack', 1 },
            { 'utility-science-pack', 1 },
            { 'space-science-pack', 1 },
        }
    end
end

for tier, name in pairs(diggy_axe_names) do
    local prerequisites = data:extend({
        {
            type = 'technology',
            name = 'diggy-axe-'..tier,
            localised_name = name,
            icon = '__base__/graphics/technology/steel-axe.png',
            icon_size = 256,
            effects = {
                {
                    type = 'character-mining-speed',
                    modifier = 0.1,
                },
            },
            prerequisites = (tier == 1) and { 'steel-axe' } or { 'diggy-axe-' .. (tier-1) },
            unit = {
                count = tier * 250,
                ingredients = ingredients(tier),
                time = 60,
            },
            upgrade = true,
        },
    })
end