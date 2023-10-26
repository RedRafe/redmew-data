for ___, p in pairs(data.raw['unit-spawner']) do
  local effect = {
    type = 'direct',
    action_delivery = {
      type = 'instant',
      source_effects = {
        { 
          type = 'script',
          effect_id = 'unit-spawner-built',
        },
      }
    }
  }

  if not p.created_effect then p.created_effect = {} end
  table.insert(p.created_effect, effect)
end