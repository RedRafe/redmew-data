-- Credits to "Everything on Nauvis" mod by Spaghetti2364
---------------------------------------------------------

--- Items
data.raw.item['metallic-asteroid-chunk'].stack_size = 50
data.raw.item['carbonic-asteroid-chunk'].stack_size = 50
data.raw.item['oxide-asteroid-chunk'].stack_size = 50
data.raw.item['promethium-asteroid-chunk'].stack_size = 50

data.raw.item['lightning-rod'].hidden = true
data.raw.item['lightning-collector'].hidden = true

data.raw['lightning-attractor']['lightning-rod'].hidden = true
data.raw['lightning-attractor']['lightning-collector'].hidden = true

-- Recipes
data.raw.recipe['lightning-rod'].hidden = true
data.raw.recipe['lightning-collector'].hidden = true

-- Technologies
-- Add new technology for traveling to solar system edge
data:extend({
    {
        type = 'technology',
        name = 'solar-system-edge-discovery',
        icon = '__space-age__/graphics/icons/solar-system-edge.png',
        icon_size = 64,
        essential = true,
        effects = {
            {
                type = 'unlock-space-location',
                space_location = 'solar-system-edge',
                use_icon_overlay_constant = true,
            },
            {
                type = 'unlock-recipe',
                recipe = 'ammoniacal-solution-separation',
            },
            {
                type = 'unlock-recipe',
                recipe = 'solid-fuel-from-ammonia',
            },
            {
                type = 'unlock-recipe',
                recipe = 'ammonia-rocket-fuel',
            },
            {
                type = 'unlock-recipe',
                recipe = 'ice-platform',
            },
            {
                type = 'unlock-recipe',
                recipe = 'lightning-rod',
            },
        },
        prerequisites = { 'space-platform-thruster' },
        unit = {
            count = 500,
            ingredients = {
                { 'automation-science-pack', 1 },
                { 'logistic-science-pack', 1 },
                { 'chemical-science-pack', 1 },
                { 'space-science-pack', 1 },
            },
            time = 60,
        },
    },
})

-- Add prerequisite to promethium-science-pack
table.insert(data.raw.technology['promethium-science-pack'].prerequisites, 'solar-system-edge-discovery')

-- Aquilo
data.raw.technology['lithium-processing'].prerequisites = { 'rocket-turret', 'advanced-asteroid-processing', 'heating-tower', 'asteroid-reprocessing', 'electromagnetic-science-pack' }

-- Gleba
data.raw.technology['agriculture'].prerequisites = { 'landfill', 'steel-processing' }
data.raw.technology['heating-tower'].prerequisites = { 'concrete' }

-- Fulgora
data.raw.technology['lightning-collector'].hidden = true
data.raw.technology['holmium-processing'].research_trigger = { type = 'mine-entity', entity = 'holmium-ore' }
data.raw.technology['recycling'].prerequisites = { 'processing-unit', 'production-science-pack' }
data.raw.technology['recycling'].research_trigger = nil
data.raw.technology['recycling'].unit = {
    count = 100,
    ingredients = {
        { 'automation-science-pack', 1 },
        { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 },
        { 'production-science-pack', 1 },
    },
    time = 5,
}

-- Useless technology
redmew.hide_prototype('technology', 'rail-support-foundations')

-- Vulcanus
data.raw.technology['calcite-processing'].prerequisites = { 'production-science-pack' }
data.raw.technology['calcite-processing'].research_trigger = nil
data.raw.technology['calcite-processing'].unit = {
    count = 100,
    ingredients = {
        { 'automation-science-pack', 1 },
        { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 },
        { 'production-science-pack', 1 },
    },
    time = 5,
}
data.raw.technology['tungsten-carbide'].prerequisites = { 'production-science-pack' }
data.raw.technology['tungsten-carbide'].research_trigger = nil
data.raw.technology['tungsten-carbide'].unit = {
    count = 100,
    ingredients = {
        { 'automation-science-pack', 1 },
        { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 },
        { 'production-science-pack', 1 },
    },
    time = 5,
}

--- Tiles
data.raw.tile['natural-yumako-soil'].absorptions_per_second = { pollution = 0.00004 }
data.raw.tile['natural-jellynut-soil'].absorptions_per_second = { pollution = 0.00004 }
data.raw.tile['lowland-brown-blubber'].absorptions_per_second = { pollution = 0.00004 }
data.raw.tile['lowland-olive-blubber'].absorptions_per_second = { pollution = 0.00004 }
data.raw.tile['lowland-olive-blubber-2'].absorptions_per_second = { pollution = 0.00004 }
data.raw.tile['lowland-olive-blubber-3'].absorptions_per_second = { pollution = 0.00004 }
data.raw.tile['lowland-pale-green'].absorptions_per_second = { pollution = 0.00004 }
data.raw.tile['lowland-cream-cauliflower'].absorptions_per_second = { pollution = 0.00004 }
data.raw.tile['lowland-cream-cauliflower-2'].absorptions_per_second = { pollution = 0.00004 }
data.raw.tile['lowland-dead-skin'].absorptions_per_second = { pollution = 0.00004 }
data.raw.tile['lowland-dead-skin-2'].absorptions_per_second = { pollution = 0.00004 }
data.raw.tile['lowland-cream-red'].absorptions_per_second = { pollution = 0.00004 }
data.raw.tile['lowland-red-vein'].absorptions_per_second = { pollution = 0.00003 }
data.raw.tile['lowland-red-vein-2'].absorptions_per_second = { pollution = 0.00003 }
data.raw.tile['lowland-red-vein-3'].absorptions_per_second = { pollution = 0.00003 }
data.raw.tile['lowland-red-vein-4'].absorptions_per_second = { pollution = 0.00003 }
data.raw.tile['lowland-red-vein-dead'].absorptions_per_second = { pollution = 0.00003 }
data.raw.tile['lowland-red-infection'].absorptions_per_second = { pollution = 0.00003 }
data.raw.tile['midland-turquoise-bark'].absorptions_per_second = { pollution = 0.00004 }
data.raw.tile['midland-turquoise-bark-2'].absorptions_per_second = { pollution = 0.00004 }
data.raw.tile['midland-cracked-lichen'].absorptions_per_second = { pollution = 0.00002 }
data.raw.tile['midland-cracked-lichen-dull'].absorptions_per_second = { pollution = 0.00002 }
data.raw.tile['midland-cracked-lichen-dark'].absorptions_per_second = { pollution = 0.00002 }
data.raw.tile['midland-yellow-crust'].absorptions_per_second = { pollution = 0.000025 }
data.raw.tile['midland-yellow-crust-2'].absorptions_per_second = { pollution = 0.000025 }
data.raw.tile['midland-yellow-crust-3'].absorptions_per_second = { pollution = 0.000025 }
data.raw.tile['midland-yellow-crust-4'].absorptions_per_second = { pollution = 0.000025 }
data.raw.tile['highland-dark-rock'].absorptions_per_second = { pollution = 0.00002 }
data.raw.tile['highland-dark-rock-2'].absorptions_per_second = { pollution = 0.00002 }
data.raw.tile['highland-yellow-rock'].absorptions_per_second = { pollution = 0.00002 }
data.raw.tile['pit-rock'].absorptions_per_second = { pollution = 0.000015 }
