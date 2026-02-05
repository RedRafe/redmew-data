data:extend({
    {
        type = 'technology',
        name = 'milestones',
        icon = '__base__/graphics/achievement/mining-with-determination.png',
        icon_size = 128,
        effects = {},
        prerequisites = { },
        research_trigger = { type = 'mine-entity', entity = 'coal' },
    }
})

local bonus = 0.05 -- could allow different bonuses per recipe

for _, item in pairs({
    { order = 'a', change = bonus, name = 'iron-plate',  },
    { order = 'b', change = bonus, name = 'copper-plate',  },
    { order = 'c', change = bonus, name = 'steel-plate',  },
    { order = 'd', change = bonus, name = 'stone-brick',  },
    { order = 'e', change = bonus, name = 'electronic-circuit',  },
    { order = 'f', change = bonus, name = 'advanced-circuit',  },
    { order = 'g', change = bonus, name = 'processing-unit',  },
    { order = 'h', change = bonus, name = 'plastic-bar',  },
    { order = 'i', change = bonus, name = 'low-density-structure',  },
    { order = 'j', change = bonus, name = 'rocket-fuel',  },
}) do
    local previous_level
    for index, level in pairs({
        { frame = 'bronze', count = 1e6, color = '139,69,19',   localised_name = 'Bronze' },
        { frame = 'silver', count = 1e7, color = '128,128,128', localised_name = 'Silver' },
        { frame = 'gold',   count = 1e8, color = '210,105,30',  localised_name = 'Gold'   },
        { frame = 'mythic', count = 1e9, color = '0,206,209',   localised_name = 'Mythic' },
    }) do
        local current_level = item.name .. '-milestone-'..index
        data:extend({
            {
                type = 'technology',
                name = current_level,
                localised_name = { '', '[color=', level.color, ']', level.localised_name, ' ', {'item-name.'..item.name}, ' Milestone[/color]' },
                icons = {
                    { icon = '__redmew-data__/graphics/achievements/'..level.frame..'.png', icon_size = 128 },
                    { icon = '__base__/graphics/icons/'..item.name..'.png', scale = 1.5 },
                    { icon = '__redmew-data__/graphics/achievements/'..level.frame..'-overlay.png', icon_size = 128 },
                },
                effects = {
                    { type = 'change-recipe-productivity', recipe = item.name, change = item.change },
                },
                prerequisites = previous_level and { previous_level } or { 'milestones' },
                research_trigger = { type = 'craft-item', item = item.name, count = level.count },
                order = 'milestones-'..index..'-'..item.order,
                upgrade = true,
            }
        })
        previous_level = current_level
    end
end
