local resources = {
    'aluminum-ore',
    'coal',
    'copper-ore',
    'gold-ore',
    'graphite',
    'iron-ore',
    'lead-ore',
    'rich-copper-ore',
    'salt',
    'stone',
    'tin-ore',
    'titanium-ore',
    'tungsten-ore',
    'uranium-ore',
    'zircon',
}

for _, name in pairs(resources) do
    local res = data.raw.resource[name]
    if res then
        if res.minable and res.minable.required_fluid then
            res.minable.required_fluid = nil
            res.minable.fluid_amount = nil
        end
    end
end
