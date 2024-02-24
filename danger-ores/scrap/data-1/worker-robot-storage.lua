local worker_robots_storage_4 = table.deepcopy(data.raw['technology']['worker-robots-storage-3'])
worker_robots_storage_4.name = 'worker-robots-storage-4'
worker_robots_storage_4.unit = {
  count = nil,
  count_formula = '2^(L-3)*450',
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
worker_robots_storage_4.max_level = 'infinite'
worker_robots_storage_4.prerequisites = { 'worker-robots-storage-3', 'space-science-pack' }

data:extend{worker_robots_storage_4}