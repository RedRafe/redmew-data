local effect = {
  type = "direct",
  action_delivery = {
    type = "instant",
    source_effects = {
      {
        type = "script",
        effect_id = "k2-transciever-activated",
      },
    }
  }
}
local ait = data.raw["electric-energy-interface"]["kr-activated-intergalactic-transceiver"]
if not ait.created_effect then ait.created_effect = {} end
table.insert(ait.created_effect, effect)
