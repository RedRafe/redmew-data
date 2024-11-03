local stack_size = settings.startup['do_ore_stack_size'].value

  if stack_size == 0 then return end
  
  local ores = {
    'coal',
    'copper-ore',
    'gold-ore',
    'iron-ore',
    'stone',
    'sulfur',
    'tin-ore',
    'uranium-ore',
  }
  
  for _, name in pairs(ores) do
    local i = data.raw.item[name]
    if i then i.stack_size = stack_size end
  end