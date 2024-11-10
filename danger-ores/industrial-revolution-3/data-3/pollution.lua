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
    if entity and entity.energy_source and entity.energy_source.emissions_per_minute then
      local epm = entity.energy_source.emissions_per_minute
      if epm.pollution and epm.pollution > 0 then
        epm.pollution = epm.pollution * 2
      end
      if epm.pollution and epm.pollution <= 0 then
        epm.pollution = 0
      end
    end
  end
end