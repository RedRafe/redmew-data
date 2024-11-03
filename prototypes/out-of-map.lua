local oom = data.raw.tile['out-of-map']

if oom and oom.absorptions_per_second then
  for id, _ in pairs(oom.absorptions_per_second) do
    oom.absorptions_per_second[id] = 0
  end
end