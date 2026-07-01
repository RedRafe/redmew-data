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
-- Modify vanilla stellar-discovery-solar-system-edge to use cheaper prerequisites and unlock Aquilo recipes
local edge_tech = data.raw.technology['stellar-discovery-solar-system-edge']
if edge_tech then
    edge_tech.prerequisites = { 'space-platform-thruster' }
    edge_tech.unit = {
        count = 500,
        ingredients = {
            { 'automation-science-pack', 1 },
            { 'logistic-science-pack', 1 },
            { 'chemical-science-pack', 1 },
            { 'space-science-pack', 1 },
        },
        time = 60,
    }
    for _, recipe_name in ipairs({
        'ammoniacal-solution-separation',
        'solid-fuel-from-ammonia',
        'ammonia-rocket-fuel',
        'ice-platform',
        'lightning-rod',
    }) do
        table.insert(edge_tech.effects, { type = 'unlock-recipe', recipe = recipe_name })
    end
end
-- promethium-science-pack already requires stellar-discovery-solar-system-edge in vanilla 2.1

-- Aquilo
data.raw.technology['lithium-processing'].prerequisites = { 'rocket-turret', 'advanced-asteroid-processing', 'heating-tower', 'asteroid-reprocessing', 'electromagnetic-science-pack' }

-- Gleba
data.raw.technology['agriculture'].prerequisites = { 'landfill', 'steel-processing' }
data.raw.technology['heating-tower'].prerequisites = { 'concrete' }

-- Fulgora
data.raw.technology['lightning-collector'].hidden = true
data.raw.technology['holmium-processing'].research_trigger = { type = 'mine-entity', entities = {'holmium-ore'} }
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
