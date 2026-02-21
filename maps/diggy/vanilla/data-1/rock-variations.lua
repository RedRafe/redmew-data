local tints = {
    Charcoal = { 90, 90, 90 },
    CloudGrey = { 168, 175, 180 },
    DustyClay = { 198, 168, 150 },
    FadedLilac = { 205, 190, 210 },
    PastelApricot = { 252, 210, 178 },
    PastelBlush = { 239, 201, 206 },
    PastelDark = { 50, 50, 50 },
    PastelLavender = { 225, 202, 255 },
    PastelMint = { 189, 234, 207 },
    PastelSky = { 187, 222, 251 },
    Sandstone = { 170, 158, 136 },
}

for _, base_name in pairs({ 'big-rock', 'huge-rock' }) do
    local base = data.raw['simple-entity'][base_name]
    local pictures = table.deepcopy(base.pictures)

    for _, layer in pairs(pictures) do
        layer.filename = layer.filename:gsub('__base__/graphics/decorative', '__redmew-data__/graphics/entity')

        for _, tint in pairs(tints) do
            local pic = table.deepcopy(layer)
            pic.tint = tint
            table.insert(base.pictures, pic)
        end
    end
end
