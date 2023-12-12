local blooms = table.deepcopy(data.raw.recipe['ei_alien-seed:growing'])

blooms.name = 'ei_alien-seed:growing-2'
blooms.ingredients = {
  { name = 'ei_oxygen-gas', type = 'fluid', amount = 2000 },
  { name = 'ei_crystal-solution', type = 'fluid', amount = 50},
  { name = 'advanced-circuit', type = 'item', amount = 60 }
}

local stabilizer = table.deepcopy(data.raw.recipe['ei_fusion-reactor'])
stabilizer.name = 'ei_alien-stabilizer'
stabilizer.main_product = 'ei_alien-stabilizer'
stabilizer.result = 'ei_alien-stabilizer'

data:extend({ blooms, stabilizer })

redmew.add_unlock('ei_bio-chamber', 'ei_alien-seed:growing-2')
redmew.add_unlock('ei_high-tech-parts', 'ei_alien-stabilizer')
