local enemy_autoplace = require '__base__.prototypes.entity.enemy-autoplace-utils'

data.raw['unit-spawner']['gleba-spawner'].absorptions_per_second = { pollution = { absolute = 20, proportional = 0.01 } }
data.raw['unit-spawner']['gleba-spawner'].autoplace = enemy_autoplace.enemy_worm_autoplace('enemy_autoplace_base(9, 13)')
data.raw['unit-spawner']['gleba-spawner'].collision_mask = table.deepcopy(data.raw['unit-spawner']['spitter-spawner'].collision_mask)

data.raw['unit-spawner']['gleba-spawner-small'].absorptions_per_second = { pollution = { absolute = 20, proportional = 0.01 } }
data.raw['unit-spawner']['gleba-spawner-small'].autoplace = enemy_autoplace.enemy_worm_autoplace('enemy_autoplace_base(3, 7)')
data.raw['unit-spawner']['gleba-spawner-small'].collision_mask = table.deepcopy(data.raw['unit-spawner']['spitter-spawner'].collision_mask)
