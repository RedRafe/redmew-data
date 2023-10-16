if not settings.startup['k2-danger-ores:technology_tweaks'].value then return end

--=================================================================================================

local worker_robots_storage_4 = table.deepcopy(data.raw["technology"]["worker-robots-storage-3"])
worker_robots_storage_4.name = "worker-robots-storage-4"
worker_robots_storage_4.unit = {
    count = nil,
    count_formula = "2^(L-3)*450",
    ingredients =
    {
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
      {"space-science-pack", 1},
      {"matter-tech-card", 1},
      {"advanced-tech-card", 1},
      {"singularity-tech-card", 1}
    },
    time = 60
  }
  worker_robots_storage_4.max_level = "infinite"
  worker_robots_storage_4.prerequisites = {"worker-robots-storage-3", "kr-singularity-tech-card"}

data:extend{worker_robots_storage_4}