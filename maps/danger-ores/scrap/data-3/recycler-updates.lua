local tech = data.raw.technology.recycling
if tech then
  tech.unit = nil
  tech.research_trigger = {
    type = 'build-entity',
    entity = 'recycler',
  }
end

local recipe = data.raw.recipe.recycler
if recipe then
  recipe.ingredients = {
    { type = 'item', name = 'iron-plate', amount = 10 },
    { type = 'item', name = 'iron-gear-wheel', amount = 7 },
    { type = 'item', name = 'electronic-circuit', amount = 5 },
    { type = 'item', name = 'assembling-machine-1', amount = 2 },
  }
end

local recycler = data.raw.furnace.recycler
if recycler then
  recycler.energy_source = {
    type = 'burner',
    fuel_categories = { 'chemical' },
    effectivity = 1,
    fuel_inventory_size = 1,
    emissions_per_minute = { pollution = 2 },
    smoke = {
      {
        name = 'smoke',
        deviation = { 0.1, 0.1 },
        frequency = 5,
        position = { 0.0, -0.8 },
        starting_vertical_speed = 0.08,
        starting_frame_deviation = 60,
      },
    },
  }
end

local function _item(name, amount)
  return { type = 'item', name = name, amount = amount or 1, probability = 0.25 }
end

for name, results in pairs({
  ['plastic-bar-recycling'] = { _item('coal') },
  ['steel-plate-recycling'] = { _item('iron-plate', 5) },
  ['battery-recycling'] = { _item('iron-plate'), _item('copper-plate') },
  ['stone-brick-recycling'] = { _item('stone', 2) },
  ['iron-plate-recycling'] = { _item('iron-ore') },
}) do
  local recipe = data.raw.recipe[name]
  recipe.results = results
end