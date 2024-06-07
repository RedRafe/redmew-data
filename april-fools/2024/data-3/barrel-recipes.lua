for f, _ in pairs(data.raw.fluid) do
  for i, recipe_name in pairs({
    'empty-' .. f .. '-canister',
    'empty-' .. f .. '-barrel',
    'fill-' .. f .. '-canister',
    'fill-' .. f .. '-barrel',
  }) do
    local recipe = data.raw.recipe[recipe_name]
    if recipe ~= nil then
      redmew.update_prototype { type = 'recipe', name = recipe_name, category = 'redmew-barreling' }
    end
  end
end

for _, e in pairs(data.raw['assembling-machine']) do
  if redmew.table_contains(e.crafting_categories, 'crafting-with-fluid') then
    table.insert(e.crafting_categories, 'redmew-barreling')
    table.insert(e.crafting_categories, 'redmew-unbarreling')
  end
end
