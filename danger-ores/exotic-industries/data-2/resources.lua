local stack_size = settings.startup['do_ore_stack_size'].value

  if stack_size == 0 then return end
  
  local ores = {
    'coal',
    'copper-ore',
    'iron-ore',
    'stone',
    'uranium-ore',
    'ei_coal-chunk',
    'ei_copper-chunk',
    'ei_gold-chunk',
    'ei_iron-chunk',
    'ei_lead-chunk',
    'ei_neodym-chunk',
    'ei_sulfur-chunk',
    'ei_uranium-chunk',
    'ei_poor-copper-chunk',
    'ei_poor-iron-chunk',
  }
  
  for _, name in pairs(ores) do
    local i = data.raw.item[name]
    if i then i.stack_size = stack_size end
  end