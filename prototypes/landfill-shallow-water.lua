if not redmew.table_contains(data.raw.item.landfill.place_as_tile.tile_condition, 'water-shallow') then
  table.insert(data.raw.item.landfill.place_as_tile.tile_condition, 'water-shallow')
end
if not redmew.table_contains(data.raw.item.landfill.place_as_tile.tile_condition, 'water-mud') then
  table.insert(data.raw.item.landfill.place_as_tile.tile_condition, 'water-mud')
end
