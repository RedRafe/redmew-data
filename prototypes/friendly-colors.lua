local PALETTE = redmew.PALETTE

local function apply_all_entities_friendly_colors()
  for _, source in pairs({
    'accumulator',
    'ammo-turret',
    'assembling-machine',
    'beacon',
    'boiler',
    'burner-generator',
    'container',
    'curved-rail',
    'electric-energy-interface',
    'electric-pole',
    'electric-turret',
    'fluid-turret',
    'furnace',
    'gate',
    'generator',
    'heat-pipe',
    'inserter',
    'lab',
    'logistic-container',
    'mining-drill',
    'pipe-to-ground',
    'pipe',
    'pump',
    'radar',
    'reactor',
    'roboport',
    'rocket-silo',
    'simple-entity',
    'solar-panel',
    'storage-tank',
    'straight-rail',
    'tree',
    'wall',
    }) do redmew.type_friendly_color(source, PALETTE[source])
  end

  redmew.entity_friendly_color('assembling-machine', 'centrifuge',     PALETTE['centrifuge'])
  redmew.entity_friendly_color('assembling-machine', 'chemical-plant', PALETTE['chemical-plant'])
  redmew.entity_friendly_color('assembling-machine', 'oil-refinery',   PALETTE['oil-refinery'])

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
end

function apply_basic_friendly_colors()
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
end

--apply_all_entities_friendly_colors()
apply_basic_friendly_colors()