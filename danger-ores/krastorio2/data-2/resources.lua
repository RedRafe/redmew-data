local stack_size = settings.startup['do_ore_stack_size'].value

if stack_size == 0 then return end

for ___, name in pairs({'iron-ore', 'copper-ore', 'coal', 'stone', 'compact-raw-rare-metals', 'uranium-ore'}) do
  local item = data.raw.item[name]
  if item then item.stack_size = stack_size end
end