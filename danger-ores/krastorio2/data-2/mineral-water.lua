data:extend({
  -- Recipe
  {
    type = 'recipe',
    name = 'mineral-water',
    category = 'fluid-filtration',
    always_show_made_in = true,
    always_show_products = true,
    energy_required = 8,
    enabled = false,
    ingredients =
    {
      { type = 'fluid', name = 'water', amount = 100 },
      { type = 'item', name = 'fluoride', amount = 1 },
    },
    results=
    {
      { type = 'fluid', name = 'mineral-water', amount = 10 },
      { type = 'fluid', name = 'water', amount = 90 },
      
    },
    main_product = 'mineral-water',
    allow_productivity = false,
    crafting_machine_tint = {
      primary = data.raw.fluid['heavy-oil'].base_color, --dirty
      secondary = { r = 0.64, g = 0.83, b = 0.93, a = 0.9 }, --clear
    },
    group = 'intermediate-products',
    subgroup = 'raw-material',
  },
})

data.raw['assembling-machine']['kr-filtration-plant'].fluid_boxes = {
  {
    production_type = 'input',
    pipe_covers = pipecoverspictures(),
    pipe_picture = kr_pipe_path,
    base_area = 10,
    base_level = -1,
    pipe_connections = { { type = 'input', position = { 0, -4 } } },
  },
  {
    production_type = 'output',
    pipe_covers = pipecoverspictures(),
    pipe_picture = kr_pipe_path,
    base_area = 10,
    base_level = 1,
    pipe_connections = { { type = 'output', position = { 0, 4 } } },
  },
  {
    production_type = 'input',
    pipe_covers = pipecoverspictures(),
    pipe_picture = kr_pipe_path,
    base_area = 10,
    base_level = 1,
    pipe_connections = { { type = 'input', position = { -4, 0 } } },
  },
  {
    production_type = 'output',
    pipe_covers = pipecoverspictures(),
    pipe_picture = kr_pipe_path,
    base_area = 10,
    base_level = 1,
    pipe_connections = { { type = 'output', position = { 4, 0 } } },
  },
  off_when_no_fluid_recipe = false,
}