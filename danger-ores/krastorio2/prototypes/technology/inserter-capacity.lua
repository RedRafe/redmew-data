if not settings.startup['k2-danger-ores:technology_tweaks'].value then return end

--=================================================================================================

local inserter_capacity_bonus_8 = table.deepcopy(data.raw["technology"]["inserter-capacity-bonus-7"])
inserter_capacity_bonus_8.name = "inserter-capacity-bonus-8"
inserter_capacity_bonus_8.unit = {
    count = nil,
    count_formula = "2^(L-7)*600",
    ingredients =
    {
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
      {"space-science-pack", 1},
      {"matter-tech-card", 1},
      {"advanced-tech-card", 1},
      {"singularity-tech-card", 1}
    },
    time = 30
  }
inserter_capacity_bonus_8.max_level = "infinite"
inserter_capacity_bonus_8.prerequisites = {"inserter-capacity-bonus-7", "kr-singularity-tech-card"}

data:extend{inserter_capacity_bonus_8}

--[[
for level = 1, 8 do
  local tech = data.raw["technology"]["inserter-capacity-bonus-" .. level]
  if not tech then
      goto continue
  end

  for key, modifier in pairs(tech.effects or {}) do
      if modifier.type == "inserter-stack-size-bonus" then
          tech.effects[key] = nil
      end
  end

  ::continue::
end
]]
