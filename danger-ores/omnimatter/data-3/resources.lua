local stack_size = settings.startup['do_ore_stack_size'].value

if stack_size == 0 then return end

for _, name in pairs({ 'omnite', 'compressed-omnite' }) do
  local item = data.raw.item[name]
  if item then item.stack_size = stack_size end
end
