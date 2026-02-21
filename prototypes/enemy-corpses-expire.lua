for _, t in pairs({ 'unit', 'unit-spawner', 'turret' }) do
    for _, source in pairs(data.raw[t]) do
        local corpse = data.raw.corpse[source.corpse]
        if corpse then
            corpse.time_before_removed = 20 * 60
        end
    end
end