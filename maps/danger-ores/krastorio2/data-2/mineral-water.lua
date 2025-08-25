data:extend({
    -- Recipe
    {
        type = 'recipe',
        name = 'mineral-water',
        category = 'kr-fluid-filtration',
        always_show_made_in = true,
        always_show_products = true,
        energy_required = 8,
        enabled = false,
        ingredients = {
            { type = 'fluid', name = 'water', amount = 100 },
            { type = 'item', name = 'fluoride', amount = 1 },
        },
        results = {
            { type = 'fluid', name = 'kr-mineral-water', amount = 10 },
            { type = 'fluid', name = 'water', amount = 90 },
        },
        main_product = 'kr-mineral-water',
        allow_productivity = false,
        crafting_machine_tint = {
            primary = data.raw.fluid['heavy-oil'].base_color, --dirty
            secondary = { r = 0.64, g = 0.83, b = 0.93, a = 0.9 }, --clear
        },
        group = 'intermediate-products',
        subgroup = 'raw-material',
    },
})

data.raw['assembling-machine']['kr-filtration-plant'].fluid_boxes_off_when_no_fluid_recipe = false
data.raw['assembling-machine']['kr-filtration-plant'].fluid_boxes = {
    {
        production_type = 'input',
        pipe_picture = require '__Krastorio2__.prototypes.buildings.pipe-picture',
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = 'input', direction = defines.direction.north, position = { 0, -3 } } },
    },
    {
        production_type = 'output',
        pipe_picture = require '__Krastorio2__.prototypes.buildings.pipe-picture',
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = 'output', direction = defines.direction.west, position = { -3, 0 } } },
    },
    {
        production_type = 'output',
        pipe_picture = require '__Krastorio2__.prototypes.buildings.pipe-picture',
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = 'output', direction = defines.direction.east, position = { 3, 0 } } },
    },
    {
        production_type = 'output',
        pipe_picture = require '__Krastorio2__.prototypes.buildings.pipe-picture',
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = 'output', direction = defines.direction.south, position = { 0, 3 } } },
    },
}
