if not mods['deadlock-beltboxes-loaders'] then return end

local matter = require '__Krastorio2__.lib.public.data-stages.matter-util'
local stack_size = settings.startup['deadlock-stack-size'].value

local function has_stabilizer(recipe)
  for ___, r in pairs(recipe.results) do
    if r.name == 'charged-matter-stabilizer' then return true end
  end
  return false
end

local function get_matter_value(recipe)
  for ___, i in pairs(recipe.ingredients) do
    if i.name == 'matter' then return i.amount end
  end
  return 5
end

local function get_tech_name(item_name)
  for ___, t in pairs(data.raw.technology) do
    if t.effects then
      for ___, e in pairs(t.effects) do
        if e.type == 'unlock-recipe' and e.recipe == 'matter-to-' .. item_name then
          return t.name
        end
      end
    end
  end
end

local function set_meta(item)
  local stack = data.raw.item['deadlock-stack-' .. item]

  local r = data.raw.recipe['deadlock-stack-' .. item .. '-to-matter']
  if r ~= nil then
    r.localised_name = {"recipe-name.to-matter", stack.localised_name or {"item-name." .. item}}
    r.subgroup = 'stacks-' .. r.subgroup
  end

  local r = data.raw.recipe['matter-to-deadlock-stack-' .. item]
  if r ~= nil then
    r.localised_name = {"recipe-name.matter-to", stack.localised_name or {"item-name." .. item}}
    r.subgroup = 'stacks-' .. r.subgroup
  end
end

data:extend({
  -- Matter
  {
    type = 'item-subgroup',
    name = 'matter-conversion',
    group = 'intermediate-products',
    order = 'm1',
  },
  {
    type = 'item-subgroup',
    name = 'stacks-matter-conversion',
    group = 'intermediate-products',
    order = 'm2'
  },
  -- From matter to items
  {
    type = 'item-subgroup',
    name = 'matter-deconversion',
    group = 'intermediate-products',
    order = 'm3',
  },
  {
    type = 'item-subgroup',
    name = 'stacks-matter-deconversion',
    group = 'intermediate-products',
    order = 'm4'
  },
  -- Items that in parts use matter
  {
    type = 'item-subgroup',
    name = 'matter-items',
    group = 'intermediate-products',
    order = 'm5',
  },
})

local items = {
  'biomass',
  'coal',
  'compact-raw-rare-metals',
  'copper-ore',
  'copper-plate',
  'glass',
  'imersite-powder',
  'iron-ore',
  'iron-plate',
  'plastic-bar',
  --'quartz',
  'rare-metals',
  --'raw-imersite',
  'sand',
  'silicon',
  'steel-plate',
  'stone',
  'sulfur',
  'uranium-238',
  'uranium-ore',
  'wood',
}

for ___, item in pairs(items) do
  if data.raw.item['deadlock-stack-' .. item] ~= nil then
    local into_matter = data.raw.recipe[item .. '-to-matter']
    local from_matter = data.raw.recipe['matter-to-' .. item]

    matter.createMatterRecipe({
      item_name = 'deadlock-stack-' .. item,
      minimum_conversion_quantity = 10,
      matter_value = get_matter_value(from_matter) * stack_size,
      energy_required = stack_size,
      only_conversion = from_matter == nil,
      only_deconversion = into_matter == nil,
      need_stabilizer = has_stabilizer(from_matter),
      unlocked_by_technology = get_tech_name(item),
    })
    
    set_meta(item)
  end
end
