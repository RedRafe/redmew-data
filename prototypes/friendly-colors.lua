local PALETTE = redmew.palette

for _, source in pairs({
        'burner-generator',
        'container',
        'electric-energy-interface',
        'electric-pole',
        'generator',
        'heat-pipe',
        'logistic-container',
        'pipe-to-ground',
        'pipe',
        'pump',
        'radar',
        'reactor',
        'roboport',
        'storage-tank',
    }) do redmew.type_friendly_color(source, PALETTE[source])
end

redmew.type_friendly_color('unit-spawner', PALETTE['unit-spawner'], false)
redmew.type_friendly_color('turret',       PALETTE['turret'],       false)

-- Yellow tier
redmew.entity_friendly_color('transport-belt',   'transport-belt',   PALETTE['yellow'])
redmew.entity_friendly_color('underground-belt', 'underground-belt', PALETTE['yellow'])
redmew.entity_friendly_color('splitter',         'splitter',         PALETTE['yellow'])
redmew.entity_friendly_color('loader',           'loader',           PALETTE['yellow'])

-- Red tier
redmew.entity_friendly_color('transport-belt',   'fast-transport-belt',   PALETTE['red'])
redmew.entity_friendly_color('underground-belt', 'fast-underground-belt', PALETTE['red'])
redmew.entity_friendly_color('splitter',         'fast-splitter',         PALETTE['red'])
redmew.entity_friendly_color('loader',           'fast-loader',           PALETTE['red'])

-- Blue tier
redmew.entity_friendly_color('transport-belt',   'express-transport-belt',   PALETTE['blue'])
redmew.entity_friendly_color('underground-belt', 'express-underground-belt', PALETTE['blue'])
redmew.entity_friendly_color('splitter',         'express-splitter',         PALETTE['blue'])
redmew.entity_friendly_color('loader',           'express-loader',           PALETTE['blue'])
