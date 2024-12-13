local stack_size = settings.startup['deadlock-stack-size'].value

local stacked_recipes = {
  -- stacked_iron_plate
  {
    type = 'recipe',
    name = 'stacked-iron-plate',
    category = 'smelting',
    energy_required = 3.2 * stack_size,
    ingredients = {{ type = 'item', name = 'deadlock-stack-iron-ore', amount = 1 }},
    results = {{ type = 'item', name = 'deadlock-stack-iron-plate', amount = 1 }},
    _technology = 'deadlock-stacking-1'
  },
  -- stacked_copper_plate
  {
    type = 'recipe',
    name = 'stacked-copper-plate',
    category = 'smelting',
    energy_required = 3.2 * stack_size,
    ingredients = {{ type = 'item', name = 'deadlock-stack-copper-ore', amount = 1 }},
    results = {{ type = 'item', name = 'deadlock-stack-copper-plate', amount = 1 }},
    _technology = 'deadlock-stacking-1'
  },
  -- stacked_steel_plate
  {
    type = 'recipe',
    name = 'stacked-steel-plate',
    category = 'smelting',
    energy_required = 16 * stack_size,
    ingredients = {{ type = 'item', name = 'deadlock-stack-iron-plate', amount = 5 }},
    results = {{ type = 'item', name = 'deadlock-stack-steel-plate', amount = 1 }},
    _technology = 'deadlock-stacking-1'
  }
}

data:extend(stacked_recipes)

for ___, recipe in pairs(stacked_recipes) do 
  redmew.whitelist_productivity(recipe.name)
  redmew.add_unlock(recipe._technology, recipe.name)
end