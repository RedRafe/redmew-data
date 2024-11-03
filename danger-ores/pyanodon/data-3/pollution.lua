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
      for id, poll in pairs(entity.energy_source.emissions_per_minute or {}) do
        entity.energy_source.emissions_per_minute[id] = poll * 5
      end
    end
  end
end