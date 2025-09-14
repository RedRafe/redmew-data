for _, name in pairs({
    'kr-crush-compact-raw-rare-metals',
    'kr-crush-copper-ore',
    'kr-crush-iron-ore',
    'kr-crush-kr-imersite',
    'kr-crush-kr-rare-metal-ore',
    'kr-crush-scoal',
    'kr-crush-stone',
    'kr-crush-uranium-ore',
}) do
    data.raw.recipe[name] = nil
end
