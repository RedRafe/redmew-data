if not feature_flags.space_travel then
  return
end

local bonus = 3
local max_bonus = 1 + 3 * bonus

data.raw['utility-constants'].default.max_belt_stack_size = max_bonus

data:extend({
  {
    type = 'technology',
    name = 'belt-stacking-1',
    icons = util.technology_icon_constant_stack_size('__base__/graphics/technology/logistics-1.png'),
    effects = {
      { type = 'belt-stack-size-bonus', modifier = bonus }
    },
    prerequisites = { 'logistic-science-pack' },
    unit = {
      count = 200,
      ingredients = {
        { 'automation-science-pack', 1 },
        { 'logistic-science-pack', 1 },
      },
      time = 30,
    },
  },
  {
    type = 'technology',
    name = 'belt-stacking-2',
    icons = util.technology_icon_constant_stack_size('__base__/graphics/technology/logistics-2.png'),
    effects = {
      { type = 'belt-stack-size-bonus', modifier = bonus }
    },
    prerequisites = { 'logistic-science-pack' },
    unit = {
      count = 400,
      ingredients = {
        { 'automation-science-pack', 1 },
        { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 },
      },
      time = 45,
    },
  },
  {
    type = 'technology',
    name = 'belt-stacking-3',
    icons = util.technology_icon_constant_stack_size('__base__/graphics/technology/logistics-3.png'),
    effects = {
      { type = 'belt-stack-size-bonus', modifier = bonus }
    },
    prerequisites = { 'logistic-science-pack' },
    unit = {
      count = 600,
      ingredients = {
        { 'automation-science-pack', 1 },
        { 'logistic-science-pack', 1 },
        { 'chemical-science-pack', 1 },
        { 'production-science-pack', 1 },
        { 'utility-science-pack', 1 },
      },
      time = 60,
    },
  },
})

-- Adjust inserters
for _, inserter in pairs(data.raw.inserter) do
  --inserter.bulk = true
  inserter.grab_less_to_match_belt_stack = true
  inserter.wait_for_full_hand = true
  inserter.enter_drop_mode_if_held_stack_spoiled = true
  inserter.max_belt_stack_size = max_bonus
end

-- Adjust loaders
for _, l_type in pairs({'loader', 'loader-1x1'}) do
  for _, loader in pairs(data.raw[l_type]) do
    loader.max_belt_stack_size = max_bonus
  end
end

-- Adjust miners
for _, drill in pairs(data.raw['mining-drill']) do
  drill.drops_full_belt_stacks = true
end