local inserter_capacity_bonus_8 = table.deepcopy(data.raw['technology']['inserter-capacity-bonus-7'])
inserter_capacity_bonus_8.name = 'inserter-capacity-bonus-8'
inserter_capacity_bonus_8.unit = {
  count = nil,
  count_formula = '2^(L-7)*600',
  ingredients =
  {
    { 'automation-science-pack', 1 },
    { 'logistic-science-pack', 1 },
    { 'chemical-science-pack', 1 },
    { 'production-science-pack', 1 },
    { 'utility-science-pack', 1 },
    { 'space-science-pack', 1 }
  },
  time = 30
}
inserter_capacity_bonus_8.max_level = 'infinite'
inserter_capacity_bonus_8.prerequisites = { 'inserter-capacity-bonus-7', 'space-science-pack' }

data:extend{inserter_capacity_bonus_8}

