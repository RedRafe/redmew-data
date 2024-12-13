local resources = {
  'aluminum-ore',
  'coal',
  'copper-ore',
  'gold-ore',
  'graphite',
  'iron-ore',
  'lead-ore',
  'rich-copper-ore',
  'salt',
  'stone',
  'tin-ore',
  'titanium-ore',
  'tungsten-ore',
  'uranium-ore',
  'zircon',
}

for _, name in pairs(resources) do
  local res = data.raw.resource[name]
  if res then
    if res.minable and res.minable.required_fluid then
      res.minable.required_fluid = nil
      res.minable.fluid_amount = nil
    end
  end
end

local stack_size = settings.startup['do_ore_stack_size'].value

if stack_size == 0 then return end

local ores = {
  'aluminum-ore',
  'coal',
  'copper-ore',
  'flake-graphite',
  'gold-ore',
  'iron-ore',
  'lead-ore',
  'rich-copper-ore',
  'salt',
  'silver-ore',
  'stone',
  'tin-ore',
  'titanium-ore',
  'tungsten-ore',
  'uranium-ore',
  'zircon',
}

for _, name in pairs(ores) do
  local i = data.raw.item[name]
  if i then i.stack_size = stack_size end
end
