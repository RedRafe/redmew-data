for _, source in pairs({
  'assembling-machine',
  'boiler',
  'furnace',
  'generator',
  'lab',
  'mining-drill',
  'radar',
}) do
  for __, entity in pairs(data.raw[source]) do
    if entity and entity.energy_source then
      if entity.energy_source.emissions_per_minute and entity.energy_source.emissions_per_minute > 0 then
        entity.energy_source.emissions_per_minute = entity.energy_source.emissions_per_minute * 5
      end
      if entity.energy_source.emissions_per_minute and entity.energy_source.emissions_per_minute <= 0 then
        entity.energy_source.emissions_per_minute = 0
      end
    end
  end
end