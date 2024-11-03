local tiers = settings.startup['af_24_technology_tiers'].value or 5
local _copy = table.deepcopy
local new_techs = {}
tiers = tiers - 1 -- 1st tech is the vanilla one

local prefix = function(name, i)
  return 'redmew-' .. i .. '-' .. name
end

local localised_name = function(name)
  return name:gsub("%-[0-9]", "")
end

for _, base in pairs(data.raw.technology) do
  local cost = base.unit.count
  local max_levels = #(base.unit.ingredients or {})
  local local_tiers = math.min(max_levels-1, tiers)

  if cost and cost > 0 and max_levels > 1 then
    local prerequisites = _copy(base.prerequisites)
    local effects = _copy(base.effects)
    

    base.prerequisites = nil
    base.effects = nil
    base.icons = _copy(base.icons or {{
      icon = base.icon,
      icon_size = base.icon_size,
      icon_mipmaps = base.icon_mipmaps
    }})

    for i=1, local_tiers do
      local t = _copy(base)

      t.name = prefix(t.name, i)
      t.prerequisites = { prefix(base.name, i + 1)}
      t.localised_name = {'technology-name.' .. localised_name(base.name)}
      t.localised_description = {'technology-description.' .. localised_name(base.name)}
      t.unit.count = cost * (local_tiers + 1 - i) / (local_tiers + 1)
      t.order = prefix(base.order or '', i)

      if i == local_tiers then
        t.prerequisites = prerequisites
      end

      table.insert(t.icons, {
        icon = '__base__/graphics/icons/signal/signal_'.. (local_tiers+1-i) ..'.png',
        icon_size = 64,
        priority = 'medium',
        shift = { 80 , 80 }
      })

      table.insert(new_techs, t)
    end

    base.effects = effects
    base.prerequisites = { prefix(base.name, 1)}
    base.order = prefix(base.order or '', local_tiers+1)
    table.insert(base.icons, {
      icon = '__base__/graphics/icons/signal/signal_'.. local_tiers+1  ..'.png',
      icon_size = 64,
      priority = 'medium',
      shift = { 80 , 80 }
    })
  end
end

data:extend(new_techs)
