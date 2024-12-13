local braking_force_8 = table.deepcopy(data.raw['technology']['braking-force-7'])
braking_force_8.name = 'braking-force-8'
braking_force_8.unit = {
  count = nil,
  count_formula = '2^(L-7)*650',
  ingredients =
  {
    { 'automation-science-pack', 1 },
    { 'logistic-science-pack', 1 },
    { 'chemical-science-pack', 1 },
    { 'production-science-pack', 1 },
    { 'utility-science-pack', 1 },
    { 'space-science-pack', 1 }
  },
  time = 60
}
braking_force_8.max_level = 'infinite'
braking_force_8.prerequisites = { 'braking-force-7', 'space-science-pack' }

data:extend{braking_force_8}