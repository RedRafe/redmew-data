local make_loot = function(items)
    local total = 0
    for _, v in pairs(items) do
        total = total + (v or 0)
    end

    local results = {}
    local probablility = 1 / table_size(items)

    for name, count in pairs(items) do
        for _ = 1, count do
            results[#results+1] = {
                item = name,
                probablility = probablility,
                count_min = 0,
                count_max = 1,
            }
        end
    end

    return results
end

local loots = {
    ['unit-spawner'] = {
        ['biter-spawner'] = {
            ['iron-ore'] = 75,
            ['copper-ore'] = 45,
            ['coal'] = 20,
            ['stone'] = 5,
        },
        ['spitter-spawner'] = {
            ['iron-ore'] = 45,
            ['copper-ore'] = 75,
            ['coal'] = 20,
            ['stone'] = 5,
        },
    },
    ['turret'] = {
        ['small-worm-turret'] = {
            ['iron-ore'] = 9,
            ['copper-ore'] = 7,
            ['coal'] = 4,
            ['stone'] = 1,
        },
        ['medium-worm-turret'] = {
            ['iron-ore'] = 18,
            ['copper-ore'] = 14,
            ['coal'] = 8,
            ['stone'] = 2,
        },
        ['big-worm-turret'] = {
            ['iron-ore'] = 27,
            ['copper-ore'] = 21,
            ['coal'] = 12,
            ['stone'] = 3,
        },
        ['behemoth-worm-turret'] = {
            ['iron-ore'] = 36,
            ['copper-ore'] = 28,
            ['coal'] = 16,
            ['stone'] = 4,
        },
    },
    ['unit'] = {
        ['small-biter'] = {
            ['iron-ore'] = 5,
            ['copper-ore'] = 3,
            ['coal'] = 2,
        },
        ['small-spitter'] = {
            ['iron-ore'] = 3,
            ['copper-ore'] = 5,
            ['coal'] = 2,
        },
        ['medium-biter'] = {
            ['iron-ore'] = 9,
            ['copper-ore'] = 7,
            ['coal'] = 4,
        },
        ['medium-spitter'] = {
            ['iron-ore'] = 7,
            ['copper-ore'] = 9,
            ['coal'] = 4,
        },
        ['big-biter'] = {
            ['iron-ore'] = 45,
            ['copper-ore'] = 35,
            ['coal'] = 20,
            ['stone'] = 5,
            ['uranium-ore'] = 10,
        },
        ['big-spitter'] = {
            ['iron-ore'] = 45,
            ['copper-ore'] = 35,
            ['coal'] = 20,
            ['stone'] = 5,
            ['uranium-ore'] = 10,
        },
        ['behemoth-biter'] = {
            ['iron-ore'] = 15,
            ['copper-ore'] = 5,
            ['coal'] = 5,
            ['stone'] = 5,
            ['uranium-ore'] = 70,
        },
        ['behemoth-spitter'] = {
            ['iron-ore'] = 5,
            ['copper-ore'] = 15,
            ['coal'] = 5,
            ['stone'] = 5,
            ['uranium-ore'] = 70,
        },
    },
}

for source, subs in pairs(loots) do
    local sources = data.raw[source]
    for name, v in pairs(subs) do
        local prototype = sources[name]
        if prototype then
            prototype.loot = make_loot(v)
        end
    end
end