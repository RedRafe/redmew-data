local effect = {
  type = 'direct',
  action_delivery = {
    type = 'instant',
    source_effects = {
      {
        type = 'script',
        effect_id = 'k2-transciever-activated',
      },
    }
  }
}
local ait = data.raw['electric-energy-interface']['kr-activated-intergalactic-transceiver']
if not ait.created_effect then ait.created_effect = {} end
table.insert(ait.created_effect, effect)

if settings.startup['do:k2:win_condition'].value ~= 0 then
  local LAB_PRODUCTIVITY = 1.4
  local ASSEMBLER_PRODUCTIVITY = 1.4
  local ROCKET_LAUNCHES = settings.startup['do:k2:win_condition'].value or 1000
  local SPACE_DATA_PER_ROCKET = 2000

  local tech = data.raw.technology['kr-intergalactic-transceiver']

  tech.unit.count = ROCKET_LAUNCHES * SPACE_DATA_PER_ROCKET * ASSEMBLER_PRODUCTIVITY * LAB_PRODUCTIVITY
  tech.ignore_tech_cost_multiplier = true
end
