return {
  ['do:bronze-forestry'] = {
    name = 'do:bronze-forestry',
    type = 'assembling-machine',
    _base = 'bronze-forestry',
    next_upgrade = 'do:iron-forestry',
    localised_name = { 'entity-name.bronze-forestry' }
  },
  ['do:iron-forestry'] = {
    name = 'do:iron-forestry',
    type = 'assembling-machine',
    _base = 'iron-forestry',
    next_upgrade = 'do:chrome-forestry',
    localised_name = { 'entity-name.chrome-forestry' }
  },
  ['do:chrome-forestry'] = {
    name = 'do:chrome-forestry',
    type = 'assembling-machine',
    _base = 'chrome-forestry',
    next_upgrade = nil,
    localised_name = { 'entity-name.chrome-forestry' }
  },
}
