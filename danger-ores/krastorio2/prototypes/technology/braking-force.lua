if not settings.startup['k2-danger-ores:technology_tweaks'].value then return end

--=================================================================================================

local braking_force_8 = table.deepcopy(data.raw["technology"]["braking-force-7"])
braking_force_8.name = "braking-force-8"
braking_force_8.unit = {
    count = nil,
    count_formula = "2^(L-7)*650",
    ingredients =
    {
      { "production-science-pack", 1 },
      { "utility-science-pack", 1 },
      { "space-science-pack", 1 },
      { "matter-tech-card", 1 },
      { "advanced-tech-card", 1 },
      { "singularity-tech-card", 1 },
    },
    time = 60
  }
  braking_force_8.max_level = "infinite"
  braking_force_8.prerequisites = {"braking-force-7", "kr-singularity-tech-card"}

data:extend{braking_force_8}