local stack_size = settings.startup['do:ore_stack_size'].value

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
  }
  
  for _, name in pairs(ores) do
    local i = data.raw.item[name]
    if i then i.stack_size = stack_size end
  end