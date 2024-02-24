local reverser = data.raw.furnace['reverse-factory-1']

if reverser then
  reverser.energy_source =
  {
    type = "burner",
    fuel_category = "chemical",
    effectivity = 1,
    fuel_inventory_size = 1,
    emissions_per_minute = 2,
    smoke =
    {
      {
        name = "smoke",
        deviation = {0.1, 0.1},
        frequency = 5,
        position = {0.0, -0.8},
        starting_vertical_speed = 0.08,
        starting_frame_deviation = 60
      }
    }
  }
end


for n=1, 4 do
	local r = data.raw.furnace['reverse-factory-' .. tostring(n)]
  if r then
    for _, cat in pairs({"recycle-products", "recycle-intermediates", "recycle-productivity"}) do
      if not redmew.table_contains(r.crafting_categories, cat) then
        table.insert(r.crafting_categories, cat)
      end
    end
  end
end