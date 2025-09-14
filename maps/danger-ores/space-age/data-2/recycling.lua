for _, name in pairs({
    'iron-ore-recycling',
    'copper-ore-recycling',
    'uranium-ore-recycling',
    'tungsten-ore-recycling',
    'holmium-ore-recycling',
    'coal-recycling',
    'stone-recycling',
    'calcite-recycling',
    
}) do
    data.raw.recipe[name] = nil
end
