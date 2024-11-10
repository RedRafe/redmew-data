-- requires Reverse-Factory mod

if not mods['reverse-factory'] then
  return
end

local BLACKLIST = {
  ['fill-'] = true,
  ['empty-'] = true,
  ['kr-vc-'] = true,
  ['srf-'] = true,
}

local itemTypes = {
  'ammo','armor','item','rail-planner','gun','capsule','module','tool','repair-tool','fluid','item-with-entity-data','spidertron-remote' 
}

local efficiency = (settings.startup['rf-efficiency'].value or 100) / 100


--=================================================================================================

local function rfpipepictures()
  return
  {
    north =
    {
      filename = '__reverse-factory__/graphics/entity/pipe-north.png',
      priority = 'extra-high',
      width = 41,
      height = 40,
      shift = {0.09375, 0.4375},
      hr_version =
      {
        filename = '__reverse-factory__/graphics/entity/hr-pipe-north.png',
        priority = 'extra-high',
        width = 71,
        height = 38,
        shift = util.by_pixel(2.25, 13.5),
        scale = 0.5
      }
    },
    east =
    {
      filename = '__reverse-factory__/graphics/entity/pipe-east.png',
      priority = 'extra-high',
      width = 41,
      height = 40,
      shift = {-0.71875, 0},
      hr_version =
      {
        filename = '__reverse-factory__/graphics/entity/hr-pipe-east.png',
        priority = 'extra-high',
        width = 42,
        height = 76,
        shift = util.by_pixel(-24.5, 1),
        scale = 0.5
      }
    },
    south =
    {
      filename = '__reverse-factory__/graphics/entity/pipe-south.png',
      priority = 'extra-high',
      width = 41,
      height = 40,
      shift = {0.0625, -1},
      hr_version =
      {
        filename = '__reverse-factory__/graphics/entity/hr-pipe-south.png',
        priority = 'extra-high',
        width = 88,
        height = 61,
        shift = util.by_pixel(0, -31.25),
        scale = 0.5
      }
    },
    west =
    {
      filename = '__reverse-factory__/graphics/entity/pipe-west.png',
      priority = 'extra-high',
      width = 41,
      height = 40,
      shift = {0.78125, 0.03125},
      hr_version =
      {
        filename = '__reverse-factory__/graphics/entity/hr-pipe-west.png',
        priority = 'extra-high',
        width = 39,
        height = 73,
        shift = util.by_pixel(25.75, 1.25),
        scale = 0.5
      }
    }
  }
end

local function rfItem(n)
  local item = {
    type = 'item',
    name = 'reverse-factory-'..n,
    icon = '__reverse-factory__/graphics/item/reverse-factory-'..n..'.png',
    icon_size = 32,
    subgroup = 'smelting-machine',
    order = 'd[reverse-factory]-'..n,
    place_result = 'reverse-factory-'..n,
    stack_size = 50
  }

  return item
end

local function rfRecipe(n)
  local recipe = {
    type = 'recipe',
    name = 'reverse-factory-'..n,
    energy_required = 5,
    enabled = 'false',
    ingredients = 
    {
      { type = 'item', name = 'iron-plate', amount = 10 },
      { type = 'item', name = 'electronic-circuit', amount = 5 },
    },
      results = {{ type = 'item', name = 'reverse-factory-'..n, amount = 1 }},
  }
  if n > 1 then
    table.insert(recipe.ingredients, { type = 'item', name = 'reverse-factory-'..(n-1), amount = 2 })
  end

  return recipe
end

local function rfEntity(n)
	local entity =
	{
    type = 'furnace',
    name = 'reverse-factory-'..n,
    icon = '__reverse-factory__/graphics/item/reverse-factory-'..n..'.png',
    icon_size = 32,
    flags = {'placeable-neutral', 'placeable-player', 'player-creation'},
    minable = {
      mining_time = 0.5,
      result = 'reverse-factory-'..n
    },
    max_health = (100 + 50*n),
    corpse = 'big-remnants',
    dying_explosion = 'medium-explosion',
    light = {
      intensity = 1,
      size = 10
    },
    resistances = {
      { type = 'fire', percent = 80 }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    --Module slots set to 1,3,4,6 (T1 much weaker than T2, and T4 much stronger than t3)
    module_specification = {
      module_slots = math.floor(1.5*n),
      module_info_icon_shift = {0, 0.8},
    },
    allowed_effects = {'consumption', 'speed', 'pollution'},
    next_upgrade = (n>1 and n<4) and 'reverse-factory-'..(n+1) or nil,
    crafting_categories = {'recycling-advanced'},
    result_inventory_size = 4,
    crafting_speed = 1 + n,
    --Starts at 125kw for t1, ends at 275kw for t4
    energy_usage = (75+50*n)..'kW',
    source_inventory_size = 1,
    fast_replaceable_group = 'reverse-factory',
    energy_source = {
    type = 'electric',
      usage_priority = 'secondary-input',
      emissions_per_minute = { pollution = 1 + n },
    },
    working_sound = {
      sound = { filename = '__base__/sound/electric-furnace.ogg', volume = 0.7 },
      apparent_volume = 1.5
    },
    animation = {
      layers = {
        {
          filename = '__reverse-factory__/graphics/entity/reverse-factory-'..n..'.png',
          priority = 'high',
          width = 129,
          height = 100,
          frame_count = 1,
          shift = {0.421875, 0},
          hr_version =
          {
            filename = '__reverse-factory__/graphics/entity/hr-reverse-factory-'..n..'.png',
            priority = 'high',
            width = 239,
            height = 219,
            frame_count = 1,
            shift = util.by_pixel(0.75, 5.75),
            scale = 0.5
          }
        },
        {
          filename = '__base__/graphics/entity/electric-furnace/electric-furnace-shadow.png',
          priority = 'high',
          width = 129,
          height = 100,
          frame_count = 1,
          shift = {0.421875, 0},
          draw_as_shadow = true,
          hr_version =
          {
            filename = '__base__/graphics/entity/electric-furnace/hr-electric-furnace-shadow.png',
            priority = 'high',
            width = 227,
            height = 171,
            frame_count = 1,
            draw_as_shadow = true,
            shift = util.by_pixel(11.25, 7.75),
            scale = 0.5
          }
        }
      }
    },
    working_visualisations = {
    {
      animation = {
        filename = '__reverse-factory__/graphics/entity/reverse-factory-heater.png',
        priority = 'high',
        width = 25,
        height = 15,
        frame_count = 12,
        animation_speed = 1/n,
        shift = {0.015625, 0.890625},
        hr_version =
        {
          filename = '__reverse-factory__/graphics/entity/hr-reverse-factory-heater.png',
          priority = 'high',
          width = 60,
          height = 56,
          frame_count = 12,
          animation_speed = 1/n,
          shift = util.by_pixel(1.75, 32.75),
          scale = 0.5
        }
      },
      light = { intensity = 0.4, size = 6, shift = {0.0, 1.0} }
    },
    {
      animation = {
        filename = '__base__/graphics/entity/electric-furnace/electric-furnace-propeller-1.png',
        priority = 'high',
        width = 19,
        height = 13,
        frame_count = 4,
        animation_speed = 1/n,
        shift = {-0.671875, -0.640625},
        hr_version =
        {
          filename = '__base__/graphics/entity/electric-furnace/hr-electric-furnace-propeller-1.png',
          priority = 'high',
          width = 37,
          height = 25,
          frame_count = 4,
          animation_speed = 1/n,
          shift = util.by_pixel(-20.5, -18.5),
          scale = 0.5
        }
      }
    },
    {
      animation = {
        filename = '__base__/graphics/entity/electric-furnace/electric-furnace-propeller-2.png',
        priority = 'high',
        width = 12,
        height = 9,
        frame_count = 4,
        animation_speed = 1/n,
        shift = {0.0625, -1.234375},
        hr_version =
        {
          filename = '__base__/graphics/entity/electric-furnace/hr-electric-furnace-propeller-2.png',
          priority = 'high',
          width = 23,
          height = 15,
          frame_count = 4,
          animation_speed = 1/n,
          shift = util.by_pixel(3.5, -38),
          scale = 0.5
        }
      }
    }},
    fluid_boxes = {
			{
				production_type = 'input',
				pipe_picture = rfpipepictures(),
				pipe_covers = pipecoverspictures(),
				base_level = -1,
				base_area = 10,
				pipe_connections = {{ position = {0, 2}, type='input'}}
			},
			{
				production_type = 'output',
				pipe_picture = rfpipepictures(),
				pipe_covers = pipecoverspictures(),
				base_level = 1,
				base_area = 10,
				pipe_connections = {{ position = {-1, -2}, type='output'}}
			},
			{
				production_type = 'output',
				pipe_picture = rfpipepictures(),
				pipe_covers = pipecoverspictures(),
				base_level = 1,
				base_area = 10,
				pipe_connections = {{ position = {1, -2}, type='output'}}
			}
		},
	}
	if n == 1 then
		entity.crafting_categories = {'recycling-base'}
    entity.fluid_boxes = nil
	end

	return entity
end

local function rfTech(n)
  local tech = {
    type = 'technology',
    name = 'reverse-factory-'..n,
    icon = '__reverse-factory__/graphics/technology/reverse-factory.png',
    icon_size = 128,
    effects = {
      { type = 'unlock-recipe', recipe = 'reverse-factory-'..n }
    },		 
    unit =
    {
      count = 100 * n,
      ingredients = {
        { 'automation-science-pack', 1 },
      },
      time = 15
    }
  }
  if n > 1 then
    table.insert(tech.unit.ingredients, {'logistic-science-pack', 1})
  end

  if n > 2 then
    table.insert(tech.unit.ingredients, {'chemical-science-pack', 1})
  end

  if n > 3 then
    table.insert(tech.unit.ingredients, {'production-science-pack', 1})
  end

  return tech
end

local function skip(recipe_name)
  for prefix, _ in pairs(BLACKLIST) do
    if redmew.string.startsWith(recipe_name, prefix) then
      return true
    end
  end
  return false
end

local function get_icon_data(name)
  local item = {}
  for _, it in pairs(itemTypes) do
    if data.raw[it][name] then
      item = data.raw[it][name]
    end
  end
  return {
    icon = item.icon,
    icons = item.icons,
    icon_size = item.icon_size,
    icon_mipmaps = item.icon_mipmaps,
  }
end

local function filter_out_fluids(item_list)
  local list = {}
  for _, item in pairs(item_list) do
    if item.type ~= 'fluid' then
      table.insert(list, item)
    end
  end
  return list
end

local function process_recipe(recipe, priority)
  local r = recipe.normal or recipe

  -- get result
  local result
  if r.result then
    results = {{ name = r.result, amount = r.result_count or 1 }}
  else
    if r.main_product then
      for _, res in pairs(r.results) do
        local name = res.name or res[1]
        if name == r.main_product then
          result = table.deepcopy(res)
        end
      end
    end
  end
  if priority or not result then
    result = table.deepcopy(r.results[priority or 1])
  end

  -- parse result properties
  result.name = result.name or result[1]
  result.amount = result.amount or result[2]
  result.type = result.type or 'item'
  result.probability = result.probability or 1
  if result.amount_max or result.amount_min then
    result.amount = math.ceil(((result.amount_max or 1) + (result.amount_min or 1)) / 2)
  end
  if result.catalyst_amount then
    result.amount = math.min(1, result.amount - result.catalyst_amount)
  end

  -- get ingredients
  local ingredients = {}

  -- parse ingredients' properties
  for n, i in pairs(r.ingredients) do
    ingredients[n] = {
      name = i.name or i[1],
      amount = i.amount or i[2],
      type = i.type or 'item',
      probability = efficiency * result.probability
    }
  end

  -- Swap ingredients/results
  results, ingredients = ingredients, {{
    name = result.name,
    amount = result.amount,
    type = result.type,
  }}

  local no_fluid_ingredients = filter_out_fluids(ingredients)
  local no_fluid_results = filter_out_fluids(results)
  local icon_data = get_icon_data(result.name)

  -- build recipes
  local base_recipe = {
    name = 'srf-'..result.name,
    type = 'recipe',
    category = 'recycling-base',
    subgroup = 'recycling-base',
    localised_name = {'', 'Recycle ', {'item-name.'..result.name}},

    allow_as_intermediate = false,
    allow_decomposition = false,
    allow_intermediates = false,
    always_show_made_in = false,
    always_show_products = false,
    enabled = true,
    hidden = false,
    hide_from_player_crafting = true,
    unlock_results = false,

    icon = icon_data.icon,
    icons = icon_data.icons,
    icon_size = icon_data.icon_size,
    icon_mipmaps = icon_data.icon_mipmaps,
    energy_required = r.energy_required,

    ingredients = ingredients,
    results = results,
  }

  local adv_recipe = table.deepcopy(base_recipe)
  adv_recipe.name = redmew.string.replace(adv_recipe.name, 'srf-' , 'srf-adv-')
  adv_recipe.category = 'recycling-advanced'
  adv_recipe.subgroup = 'recycling-advanced'
  data:extend{ adv_recipe }

  if #no_fluid_ingredients > 0 then
    if (#results == #no_fluid_results) then
      data:extend{ base_recipe }
    elseif #no_fluid_results > 0 then
      base_recipe.results = no_fluid_results
      data:extend{ base_recipe }
    end
  end
end

--=================================================================================================

-- Remove recipe cats
for name, _ in pairs(data.raw.recipe) do
  if redmew.string.startsWith(name, 'rf-') then
    data.raw.recipe[name] = nil
  end
end

-- Remove recipes to regenerate
for name, _ in pairs(data.raw['recipe-category']) do
  if redmew.string.startsWith(name, 'recycle-') then
    data.raw['recipe-category'][name] = nil
  end
end

-- Override protos
for n=1, 4 do
	data:extend({ rfItem(n), rfRecipe(n), rfEntity(n), rfTech(n) })
end

data:extend({
  -- Categories for reverse recipes, used to define tiers
  {
    type = 'recipe-category',
    name = 'recycling-base'
  },
  {
    type = 'recipe-category',
    name = 'recycling-advanced'
  },
  -- Hidden group and subgroup that contains the reverse recipes
  {
    type = 'item-group',
    name = 'recycling',
    icon = '__reverse-factory__/graphics/technology/reverse-factory.png',
    icon_size = 128,
    order = 'z',
  },
  {
    type = 'item-subgroup',
    name = 'recycling-base',
    group = 'recycling',
    order = 'a',
  },
  {
    type = 'item-subgroup',
    name = 'recycling-advanced',
    group = 'recycling',
    order = 'b',
  }
})

for _, recipe in pairs(data.raw.recipe) do
  if not skip(recipe.name) then
    process_recipe(recipe)
  end
end

for _, leftover in pairs({
  {'empty-barrel', nil},
}) do
  process_recipe(data.raw.recipe[leftover[1]], leftover[2])
end


local max_outputs = 0
for _, recipe in pairs(data.raw.recipe) do
  if redmew.string.startsWith(recipe.name, 'srf-') then
    max_outputs = math.max(max_outputs, #recipe.results)
  end
end

for n=1, 4 do
  data.raw.furnace['reverse-factory-'..n].result_inventory_size = max_outputs
end
