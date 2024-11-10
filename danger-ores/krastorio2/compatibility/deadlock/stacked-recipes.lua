if not mods['deadlock-beltboxes-loaders'] then return end

local stack_size = settings.startup['deadlock-stack-size'].value
local T1 = 'deadlock-stacking-1'
local T2 = 'deadlock-stacking-2'
local T3 = 'deadlock-stacking-3'
local T4 = 'deadlock-stacking-4'
local T5 = 'deadlock-stacking-5'

local function icons_constructor(base, corner_item)
  local item = data.raw.item['deadlock-stack-'..base]
  if not item then error(base) end
  local icons = table.deepcopy(item.icons)
  local decal = data.raw.item[corner_item]
  table.insert(icons, {
    icon = decal.icon,
    icon_size = decal.icon_size,
    scale = 0.22,
    shift = { -8, -8 }
  })
  return icons
end

local stacked_recipes = {
  -- stacked_stone_brick
  {
    type = 'recipe',
    name = 'smelting-stacked-stone-brick',
    category = 'smelting',
    enabled = false,
    energy_required = 16 * stack_size,
    ingredients = {{'deadlock-stack-stone', 10}},
    results = {{ type = 'item', name = 'deadlock-stack-stone-brick', amount = 5 }},
    order = '00',
    _technology = T1
  },
  -- stacked_coke
  {
    type = 'recipe',
    name = 'smelting-stacked-coke',
    category = 'smelting',
    enabled = false,
    energy_required = 16 * stack_size,
    ingredients = {
      { type = 'item', name = 'deadlock-stack-wood', amount = 6 },
      { type = 'item', name = 'deadlock-stack-coal', amount = 6 },
    },
    results = {{ type = 'item', name = 'deadlock-stack-coke', amount = 6 }},
    order = '01',
    _technology = T1
  },
  -- stacked_glass
  {
    type = 'recipe',
    name = 'smelting-stacked-glass',
    category = 'smelting',
    enabled = false,
    energy_required = 16 * stack_size,
    ingredients = {{ type = 'item', name = 'deadlock-stack-sand', amount = 16 }},
    results = {{ type = 'item', name = 'deadlock-stack-glass', amount = 8 }},
    order = '02',
    _technology = T1
  },
  -- stacked_silicon
  {
    type = 'recipe',
    name = 'smelting-stacked-silicon',
    category = 'smelting',
    enabled = false,
    energy_required = 16 * stack_size,
    ingredients = {{ type = 'item', name = 'deadlock-stack-quartz', amount = 18 }},
    results = {{ type = 'item', name = 'deadlock-stack-silicon', amount = 9 }},
    order = '03',
    _technology = T2
  },
  -- stacked_iron_plate
  {
    type = 'recipe',
    name = 'smelting-stacked-iron-plate',
    category = 'smelting',
    enabled = false,
    energy_required = 16 * stack_size,
    ingredients = {{ type = 'item', name = 'deadlock-stack-iron-ore', amount = 0 }},
    results = {{ type = 'item', name = 'deadlock-stack-iron-plate', amount = 5 }},
    icons = icons_constructor('iron-plate', 'iron-ore'),
    order = '04',
    _technology = T1
  },
  -- stacked_enriched_iron
  {
    type = 'recipe',
    name = 'smelting-stacked-enriched-iron-plate',
    category = 'smelting',
    enabled = false,
    energy_required = 16 * stack_size,
    ingredients = {{ type = 'item', name = 'deadlock-stack-enriched-iron', amount = 5 }},
    results = {{ type = 'item', name = 'deadlock-stack-iron-plate', amount = 5 }},
    icons = icons_constructor('iron-plate', 'enriched-iron'),
    order = '05',
    _technology = T2
  },
  -- stacked_copper_plate
  {
    type = 'recipe',
    name = 'smelting-stacked-copper-plate',
    category = 'smelting',
    enabled = false,
    energy_required = 16 * stack_size,
    ingredients = {{ type = 'item', name = 'deadlock-stack-copper-ore', amount = 10 }},
    results = {{ type = 'item', name = 'deadlock-stack-copper-plate', amount = 5 }},
    icons = icons_constructor('copper-plate', 'copper-ore'),
    order = '06',
    _technology = T1
  },
  -- stacked_enriched_copper
  {
    type = 'recipe',
    name = 'smelting-stacked-enriched-copper-plate',
    category = 'smelting',
    enabled = false,
    energy_required = 16 * stack_size,
    ingredients = {{ type = 'item', name = 'deadlock-stack-enriched-copper', amount = 5 }},
    results = {{ type = 'item', name = 'deadlock-stack-copper-plate', amount = 5 }},
    icons = icons_constructor('copper-plate', 'enriched-copper'),
    order = '07',
    _technology = T2
  },
  -- stacked_rare_metals
  {
    type = 'recipe',
    name = 'smelting-stacked-raw-metals',
    category = 'smelting',
    enabled = false,
    energy_required = 16 * stack_size,
    ingredients = {{ type = 'item', name = 'deadlock-stack-raw-rare-metals', amount = 10 }},
    results = {{ type = 'item', name = 'deadlock-stack-rare-metals', amount = 5 }},
    icons = icons_constructor('rare-metals', 'raw-rare-metals'),
    order = '08',
    _technology = T2
  },
  -- stacked_enriched_raw_metals
  {
    type = 'recipe',
    name = 'smelting-stacked-enriched-raw-metals',
    category = 'smelting',
    enabled = false,
    energy_required = 16 * stack_size,
    ingredients = {{ type = 'item', name = 'deadlock-stack-enriched-rare-metals', amount = 5 }},
    results = {{ type = 'item', name = 'deadlock-stack-rare-metals', amount = 5 }},
    icons = icons_constructor('rare-metals', 'enriched-rare-metals'),
    order = '09',
    _technology = T2
  },
  -- stacked_steel_plate
  {
    type = 'recipe',
    name = 'smelting-stacked-steel-plate',
    category = 'smelting',
    enabled = false,
    energy_required = 16 * stack_size,
    ingredients = {
      { type = 'item', name = 'deadlock-stack-iron-plate', amount = 10 },
      { type = 'item', name = 'deadlock-stack-coke', amount = 2 }
    },
    results = {{ type = 'item', name = 'deadlock-stack-steel-plate', amount = 5 }},
    order = '10',
    _technology = T2
  },
  -- stacked_imersium_plate
  {
    type = 'recipe',
    name = 'smelting-stacked-imersium-plate',
    category = 'smelting',
    enabled = false,
    energy_required = 16 * stack_size,
    ingredients = {
      { type = 'item', name = 'deadlock-stack-rare-metals', amount = 6 },
      { type = 'item', name = 'deadlock-stack-imersite-powder', amount = 9 }
    },
    results = {{ type = 'item', name = 'deadlock-stack-imersium-plate', amount = 3 }},
    order = '11',
    _technology = T5
  },
}

data:extend(stacked_recipes)

for ___, recipe in pairs(stacked_recipes) do 
  redmew.whitelist_productivity(recipe.name)
  redmew.add_unlock(recipe._technology, recipe.name)
end
