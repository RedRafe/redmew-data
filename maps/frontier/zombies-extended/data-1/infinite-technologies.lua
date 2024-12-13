-- cuz ZE has shared references
for _, v in pairs(data.raw.technology) do
  data:extend { table.deepcopy(v) }
end

---@param root_tech_name string --[[i.e. 'mining-productivity']]
---@param level number
local function interrupt_infinite_tech(root_tech_name, level)
  local current = root_tech_name .. '-' .. tostring(level)
  if data.raw.technology[current] then return end
  
  for i = level, 1, -1 do
    local previous = root_tech_name .. '-' .. tostring(i)
    if data.raw.technology[previous] then
      
      local old_tech = data.raw.technology[previous]
      local new_tech = table.deepcopy(old_tech)
      new_tech.name = current
      new_tech.prerequisites = { previous }
      old_tech.max_level = level - 1
      
      -- replace prerequisites
      for _, tech in pairs(data.raw.technology) do
        if redmew.remove_prerequisite(tech.name, previous) then
          redmew.add_prerequisite(tech.name, current)
        end
      end

      -- add new
      data:extend({ new_tech })
      return
    end
  end
end

interrupt_infinite_tech('energy-weapons-damage', 8)
interrupt_infinite_tech('energy-weapons-damage', 9)
interrupt_infinite_tech('energy-weapons-damage', 10)
interrupt_infinite_tech('mining-productivity', 5)
interrupt_infinite_tech('mining-productivity', 6)
interrupt_infinite_tech('mining-productivity', 7)
interrupt_infinite_tech('mining-productivity', 8)
interrupt_infinite_tech('physical-projectile-damage', 8)
interrupt_infinite_tech('physical-projectile-damage', 9)
interrupt_infinite_tech('stronger-explosives', 8)
interrupt_infinite_tech('stronger-explosives', 9)
interrupt_infinite_tech('stronger-explosives', 10)
interrupt_infinite_tech('worker-robots-speed', 7)
interrupt_infinite_tech('worker-robots-speed', 8)
interrupt_infinite_tech('worker-robots-speed', 9)
interrupt_infinite_tech('refined-flammables', 8)
interrupt_infinite_tech('refined-flammables', 9)
