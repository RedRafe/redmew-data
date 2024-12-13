for _, rock in pairs(data.raw['simple-entity']) do
  if redmew.string.contains(rock.name, 'rock-huge') then
    rock.flags = rock.flags or {}
    table.insert(rock.flags, 'not-deconstructable')
    rock.minable.result = nil
    rock.minable.results = {
      { type = 'item', name = 'iron-ore',    amount_min = 13, amount_max = 34, probability = 0.36 },
      { type = 'item', name = 'copper-ore',  amount_min = 13, amount_max = 34, probability = 0.30 },
      { type = 'item', name = 'stone',       amount_min = 13, amount_max = 34, probability = 0.09 },
      { type = 'item', name = 'coal',        amount_min = 13, amount_max = 34, probability = 0.23 },
      { type = 'item', name = 'uranium-ore', amount_min = 13, amount_max = 34, probability = 0.02 },
    }
  end
  if redmew.string.contains(rock.name, 'rock-big') then
    rock.flags = rock.flags or {}
    table.insert(rock.flags, 'not-deconstructable')
    rock.minable.result = nil
    rock.minable.results = {
      { type = 'item', name = 'iron-ore',    amount_min = 4, amount_max = 12, probability = 0.36 },
      { type = 'item', name = 'copper-ore',  amount_min = 4, amount_max = 12, probability = 0.30 },
      { type = 'item', name = 'stone',       amount_min = 4, amount_max = 12, probability = 0.09 },
      { type = 'item', name = 'coal',        amount_min = 4, amount_max = 12, probability = 0.23 },
      { type = 'item', name = 'uranium-ore', amount_min = 4, amount_max = 12, probability = 0.02 },
    }
  end
end