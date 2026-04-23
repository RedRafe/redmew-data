-- DATA UTIL LIBRARY
--=================================================================================================

local function has_ingredient(recipe, ingredient)
    if recipe ~= nil and recipe.ingredients ~= nil then
        for i, existing in pairs(recipe.ingredients) do
            if existing[1] == ingredient or existing.name == ingredient then
                return true
            end
        end
    end
    return false
end

local function add_ingredient(recipe, ingredient, quantity, is_fluid)
    if recipe ~= nil and recipe.ingredients ~= nil then
        for i, existing in pairs(recipe.ingredients) do
            if existing[1] == ingredient or existing.name == ingredient then
                return
            end
        end
        if is_fluid then
            table.insert(recipe.ingredients, { type = 'fluid', name = ingredient, amount = quantity })
        else
            table.insert(recipe.ingredients, { type = 'item', name = ingredient, amount = quantity })
        end
    end
end

local function replace_ingredient(recipe, old, new, amount, multiply)
    if recipe ~= nil and recipe.ingredients ~= nil then
        for i, existing in pairs(recipe.ingredients) do
            if existing[1] == new or existing.name == new then
                if existing.amount then
                    existing.amount = amount
                end
                if existing[2] then
                    existing[2] = amount
                end
                return
            end
        end
        for i, ingredient in pairs(recipe.ingredients) do
            if ingredient.name == old then
                ingredient.name = new
                if amount then
                    if multiply then
                        ingredient.amount = amount * ingredient.amount
                    else
                        ingredient.amount = amount
                    end
                end
            end
            if ingredient[1] == old then
                ingredient[1] = new
                if amount then
                    if multiply then
                        ingredient[2] = amount * ingredient[2]
                    else
                        ingredient[2] = amount
                    end
                end
            end
        end
    end
end

local function remove_ingredient(recipe, old)
    index = -1
    if recipe ~= nil and recipe.ingredients ~= nil then
        for i, ingredient in pairs(recipe.ingredients) do
            if ingredient.name == old or ingredient[1] == old then
                index = i
                break
            end
        end
        if index > -1 then
            table.remove(recipe.ingredients, index)
        end
    end
end

local function multiply_recipe(recipe, multiple)
    if recipe then
        if recipe.energy_required then
            recipe.energy_required = recipe.energy_required * multiple
        else
            recipe.energy_required = 0.5 * multiple -- 0.5 is factorio default
        end
        if recipe.result_count then
            recipe.result_count = recipe.result_count * multiple
        end
        if recipe.results then
            for i, result in pairs(recipe.results) do
                if result.name then
                    if result.amount then
                        result.amount = result.amount * multiple
                    end
                    if result.amount_min ~= nil then
                        result.amount_min = result.amount_min * multiple
                        result.amount_max = result.amount_max * multiple
                    end
                    if result.catalyst_amount then
                        result.catalyst_amount = result.catalyst_amount * multiple
                    end
                end
                if result[1] then
                    result[2] = result[2] * multiple
                end
            end
        end
        if not recipe.results and not recipe.result_count then
            -- implicit one item result
            recipe.result_count = multiple
        end
        if recipe.ingredients then
            for i, ingredient in pairs(recipe.ingredients) do
                if ingredient.name then
                    ingredient.amount = ingredient.amount * multiple
                end
                if ingredient[1] then
                    ingredient[2] = ingredient[2] * multiple
                end
            end
        end
    end
end

-- ============================================================================

-- HIDE a prototype ffrom the data table
redmew.hide_prototype = function(_type, name)
    if data.raw[_type][name] then
        data.raw[_type][name].hidden = true
    end
end

-- REMOVE a prototype from the data table
redmew.remove_prototype = function(_type, name)
    if data.raw[_type][name] then
        data.raw[_type][name] = nil
    end
end

-- ADD a prerequisite to a given technology
redmew.add_prerequisite = function(tech_name, prerequisite)
    local technology = data.raw.technology[tech_name]
    if not technology then
        return
    end
    for _, name in pairs(technology.prerequisites) do
        if name == prerequisite then
            return
        end
    end
    table.insert(technology.prerequisites, prerequisite)
end

-- REPLACE a prerequisite with another
redmew.replace_prerequisite = function(tech_name, old, new)
    redmew.remove_prerequisite(tech_name, old)
    redmew.add_prerequisite(tech_name, new)
end

-- REMOVE a prerequisite from a given tech
redmew.remove_prerequisite = function(tech_name, prerequisite)
    local technology = data.raw.technology[tech_name]
    if not technology then
        return
    end
    for i, name in pairs(technology.prerequisites or {}) do
        if name == prerequisite then
            table.remove(technology.prerequisites, i)
            return true
        end
    end
    return false
end

---@param root_tech_name string --[[i.e. 'mining-productivity']]
---@param level number
redmew.interrupt_infinite_tech = function(root_tech_name, level)
    local current = string.format('%s-%d', root_tech_name, level)
    if data.raw.technology[current] then
        return
    end

    for i = level, -1, -1 do
        local previous = string.format('%s-%d', root_tech_name, i)
        
        if i == 0 then
            previous = root_tech_name
        end
        if data.raw.technology[previous] then
            local old_tech = data.raw.technology[previous]
            local new_tech = table.deepcopy(old_tech)
            new_tech.name = current
            new_tech.prerequisites = { previous }
            old_tech.max_level = level - 1

            -- replace prerequisites
            for _, tech in pairs(data.raw.technology) do
                if redmew.remove_prerequisite(tech.name, previous) then
                    redmew.add_prerequisite(tech.name, current)
                end
            end

            -- add new
            data:extend({ new_tech })
            return
        end
    end
end

-- ADD science pack to a given tech
redmew.add_research_ingredient = function(tech_name, ingredient)
    local technology = data.raw.technology[tech_name]
    if not technology then
        return
    end
    for _, name in pairs(technology.unit.ingredients) do
        if name[1] == ingredient then
            return
        end
    end
    table.insert(technology.unit.ingredients, { ingredient, 1 })
end

-- REPLACE a science pack with another
redmew.replace_research_ingredient = function(tech_name, old, new)
    redmew.remove_research_ingredient(tech_name, old)
    redmew.add_research_ingredient(tech_name, new)
end

-- REMOVE science pack from a given tech
redmew.remove_research_ingredient = function(tech_name, ingredient)
    local technology = data.raw.technology[tech_name]
    if not technology then
        return
    end
    for i, v in pairs(technology.unit.ingredients) do
        if v[1] and v[1] == ingredient then
            table.remove(technology.unit.ingredients, i)
        end
        if v.name and v.name == ingredient then
            table.remove(technology.unit.ingredients, i)
        end
    end
end

-- ADD an effect to a given technology
redmew.add_effect = function(technology_name, effect)
    local technology = data.raw.technology[technology_name]
    if not technology then
        return
    end
    if not technology.effects then
        technology.effects = {}
    end
    if effect and effect.type == 'unlock-recipe' then
        if not data.raw.recipe[effect.recipe] then
            return
        end
        table.insert(technology.effects, effect)
    end
end

-- ADD an effect to a given technology to unlock recipe
redmew.add_unlock = function(technology_name, recipe)
    redmew.add_effect(technology_name, { type = 'unlock-recipe', recipe = recipe })
end

-- REMOVE recipe unlock effect from a given technology, multiple times if necessary
redmew.remove_recipe_effect = function(technology_name, recipe_name)
    local technology = data.raw.technology[technology_name]
    if not technology then
        return
    end
    local index = -1
    local cnt = 0
    if technology and technology.effects then
        for i, effect in pairs(technology.effects) do
            if effect.type == 'unlock-recipe' and effect.recipe == recipe_name then
                index = i
                cnt = cnt + 1
            end
        end
        if index > -1 then
            table.remove(technology.effects, index)
            if cnt > 1 then -- not over yet, do it again
                redmew.remove_recipe_effect(technology_name, recipe_name)
            end
        end
    end
end

-- REMOVE all instances of unlocks for a given recipe
redmew.remove_all_recipe_effects = function(recipe_name)
    for name, _ in pairs(data.raw.technology) do
        redmew.remove_recipe_effect(name, recipe_name)
    end
end

-- MOVE an unlock from a technology to another
redmew.move_recipe_unlock = function(recipe_name, old, new)
    redmew.remove_recipe_effect(old, recipe_name)
    redmew.add_unlock(new, recipe_name)
end

-- ADD recipe to productivity whitelisted limitations
redmew.whitelist_productivity = function(recipe_name)
    local recipe = data.raw.recipe[recipe_name]
    if recipe then
        recipe.allow_productivity = true
    end
end

-- Returns true if a recipe has an ingredient
redmew.has_ingredient = function(recipe_name, ingredient)
    return data.raw.recipe[recipe_name] and (has_ingredient(data.raw.recipe[recipe_name], ingredient) or has_ingredient(data.raw.recipe[recipe_name].normal, ingredient))
end

-- ADD a given quantity of ingredient to target recipe
redmew.add_ingredient = function(recipe_name, ingredient, quantity)
    local is_fluid = not not data.raw.fluid[ingredient]
    if data.raw.recipe[recipe_name] and (data.raw.item[ingredient] or is_fluid) then
        add_ingredient(data.raw.recipe[recipe_name], ingredient, quantity, is_fluid)
        add_ingredient(data.raw.recipe[recipe_name].normal, ingredient, quantity, is_fluid)
        add_ingredient(data.raw.recipe[recipe_name].expensive, ingredient, quantity, is_fluid)
    end
end

-- REPLACE one ingredient with another in a recipe
--    Use amount to set an amount. If that amount is a multiplier instead of an exact amount, set multiply true.
redmew.replace_ingredient = function(recipe_name, old, new, amount, multiply)
    if data.raw.recipe[recipe_name] and (data.raw.item[new] or data.raw.fluid[new]) then
        replace_ingredient(data.raw.recipe[recipe_name], old, new, amount, multiply)
        replace_ingredient(data.raw.recipe[recipe_name].normal, old, new, amount, multiply)
        replace_ingredient(data.raw.recipe[recipe_name].expensive, old, new, amount, multiply)
    end
end

-- REMOVE an ingredient from a recipe
redmew.remove_ingredient = function(recipe_name, old)
    if data.raw.recipe[recipe_name] then
        remove_ingredient(data.raw.recipe[recipe_name], old)
        remove_ingredient(data.raw.recipe[recipe_name].normal, old)
        remove_ingredient(data.raw.recipe[recipe_name].expensive, old)
    end
end

-- MULTIPLY the cost, energy, and results of a recipe by a multiple
redmew.multiply_recipe = function(recipe_name, multiple, options)
    if data.raw.recipe[recipe_name] then
        multiply_recipe(data.raw.recipe[recipe_name], multiple)
        multiply_recipe(data.raw.recipe[recipe_name].normal, multiple)
        multiply_recipe(data.raw.recipe[recipe_name].expensive, multiple)
    end
end

--=================================================================================================

local reskin_library = {}
redmew.reskin_library = reskin_library

---@param name string 'solar-panel'
---@param tint_mask? Color
---@param tint_highlights? Color
reskin_library.make_item_icons = function(name, tint_mask, tint_highlights)
    local path = '__redmew-data__/graphics/icons/' .. name .. '/' .. name
    local path_base = path .. '-icon-base.png'
    local path_mask = path .. '-icon-mask.png'
    local path_highlights = path .. '-icon-highlights.png'

    return {
        { icon = path_base, icon_size = 64, scale = 0.5 },
        { icon = path_mask, icon_size = 64, scale = 0.5, tint = tint_mask },
        { icon = path_highlights, icon_size = 64, scale = 0.5, tint = tint_highlights or { 1, 1, 1 } },
    }
end

---@param name string 'solar-energy'
---@param tint_mask Color
---@param tint_highlights? Color
reskin_library.make_technology_icons = function(name, tint_mask, tint_highlights)
    local path = '__redmew-data__/graphics/technology/' .. name .. '/' .. name
    local path_base = path .. '-technology-base.png'
    local path_mask = path .. '-technology-mask.png'
    local path_highlights = path .. '-technology-highlights.png'

    return {
        { icon = path_base, icon_size = 256, scale = 1 },
        { icon = path_mask, icon_size = 256, scale = 1, tint = tint_mask },
        { icon = path_highlights, icon_size = 256, scale = 1, tint = tint_highlights or { 1, 1, 1 } },
    }
end

reskin_library.make_tint_layers = function(obj)
    local layers = obj.layers
    local filepath = obj.filepath

    local layer = table.deepcopy(layers[1])
    if obj.repeat_count then
        layer.frame_count = nil
        layer.line_length = nil
        layer.repeat_count = obj.repeat_count
    end

    local base = table.deepcopy(layer)
    base.filename = filepath .. '-base.png'

    local mask = table.deepcopy(layer)
    mask.filename = filepath .. '-mask.png'
    mask.tint = obj.tint

    local highlight = table.deepcopy(layer)
    highlight.filename = filepath .. '-highlights.png'
    highlight.blend_mode = 'additive'

    table.insert(layers, 2, base)
    table.insert(layers, 3, mask)
    table.insert(layers, 4, highlight)
end

reskin_library.make_tint_layers_4_ways = function(obj)
    for _, dir in pairs({ 'north', 'south', 'east', 'west' }) do
        local o = table.deepcopy(obj)
        o.layers = obj.layers[dir].layers
        reskin_library.make_tint_layers(o)
    end
end

reskin_library.make_tint_layers_2_ways = function(obj)
    for _, dir in pairs({ 'horizontal', 'vertical' }) do
        local o = table.deepcopy(obj)
        o.layers = obj.layers[dir .. '_animation'].layers
        o.filepath = o.filepath .. '-' .. dir
        reskin_library.make_tint_layers(o)
    end
end

reskin_library.make_assembling_machine_pipe_picture = function(fluid_boxes, tint)
    for _, fb in pairs(fluid_boxes or {}) do
        for direction in pairs(fb.pipe_picture) do
            if not fb.pipe_picture[direction].layers then
                fb.pipe_picture[direction] = { layers = { fb.pipe_picture[direction] } }
            end
            reskin_library.make_tint_layers {
                layers = fb.pipe_picture[direction].layers,
                filepath = '__redmew-data__/graphics/entity/assembling-machine/pipes/assembling-machine-pipe-' .. direction,
                tint = tint,
            }
        end
    end
end

reskin_library.make_boiler_tint_layers = function(obj)
    for _, dir in pairs({ 'north', 'south', 'east', 'west' }) do
        local o = table.deepcopy(obj)
        o.layers = obj.layers[dir].structure.layers
        o.filepath = o.filepath .. '-' .. dir .. '-idle'
        reskin_library.make_tint_layers(o)
    end
end

reskin_library.make_steam_turbine_tint_layers = function(entity, tint)
    entity.horizontal_animation = {
        layers = {
            -- Base
            {
                filename = '__base__/graphics/entity/steam-turbine/steam-turbine-H.png',
                width = 320,
                height = 245,
                frame_count = 8,
                line_length = 4,
                shift = util.by_pixel(0, -2.75),
                run_mode = 'backward',
                scale = 0.5,
            },
            -- Mask
            {
                filename = '__redmew-data__/graphics/entity/steam-turbine/steam-turbine-horizontal-mask.png',
                width = 320,
                height = 245,
                repeat_count = 8,
                shift = util.by_pixel(0, -2.75),
                tint = tint,
                scale = 0.5,
            },
            -- Highlights
            {
                filename = '__redmew-data__/graphics/entity/steam-turbine/steam-turbine-horizontal-highlights.png',
                width = 320,
                height = 245,
                repeat_count = 8,
                shift = util.by_pixel(0, -2.75),
                blend_mode = 'additive',
                scale = 0.5,
            },
            -- Shadow
            {
                filename = '__base__/graphics/entity/steam-turbine/steam-turbine-H-shadow.png',
                width = 435,
                height = 150,
                repeat_count = 8,
                draw_as_shadow = true,
                shift = util.by_pixel(28.5, 18),
                run_mode = 'backward',
                scale = 0.5,
            },
        },
    }
    entity.vertical_animation = {
        layers = {
            -- Base
            {
                filename = '__base__/graphics/entity/steam-turbine/steam-turbine-V.png',
                width = 217,
                height = 374,
                frame_count = 8,
                line_length = 4,
                shift = util.by_pixel(4.75, 0.0),
                run_mode = 'backward',
                scale = 0.5,
            },
            -- Mask
            {
                filename = '__redmew-data__/graphics/entity/steam-turbine/steam-turbine-vertical-mask.png',
                width = 217,
                height = 347,
                repeat_count = 8,
                shift = util.by_pixel(4.75, 6.75),
                tint = tint,
                scale = 0.5,
            },
            -- Highlights
            {
                filename = '__redmew-data__/graphics/entity/steam-turbine/steam-turbine-vertical-highlights.png',
                width = 217,
                height = 347,
                repeat_count = 8,
                shift = util.by_pixel(4.75, 6.75),
                blend_mode = 'additive',
                scale = 0.5,
            },
            -- Shadow
            {
                filename = '__base__/graphics/entity/steam-turbine/steam-turbine-V-shadow.png',
                width = 302,
                height = 260,
                repeat_count = 8,
                draw_as_shadow = true,
                shift = util.by_pixel(39.5, 24.5),
                run_mode = 'backward',
                scale = 0.5,
            },
        },
    }
end

reskin_library.make_steam_engine_tint_layers = function(entity, tint)
    entity.horizontal_animation = {
        layers = {
            -- Base
            {
                filename = '__base__/graphics/entity/steam-engine/steam-engine-H.png',
                width = 352,
                height = 257,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(1, -4.75),
                scale = 0.5,
            },
            -- Color Mask
            {
                filename = '__redmew-data__/graphics/entity/steam-engine/steam-engine-horizontal-mask.png',
                width = 352,
                height = 257,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(1, -4.75),
                tint = tint,
                scale = 0.5,
            },
            -- Highlights
            {
                filename = '__redmew-data__/graphics/entity/steam-engine/steam-engine-horizontal-highlights.png',
                width = 352,
                height = 257,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(1, -4.75),
                blend_mode = 'additive',
                scale = 0.5,
            },
            -- Shadow
            {
                filename = '__base__/graphics/entity/steam-engine/steam-engine-H-shadow.png',
                width = 508,
                height = 160,
                frame_count = 32,
                line_length = 8,
                draw_as_shadow = true,
                shift = util.by_pixel(48, 24),
                scale = 0.5,
            },
        },
    }

    entity.vertical_animation = {
        layers = {
            -- Base
            {
                filename = '__base__/graphics/entity/steam-engine/steam-engine-V.png',
                width = 225,
                height = 391,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(4.75, -6.25),
                scale = 0.5,
            },
            -- Color mask
            {
                filename = '__redmew-data__/graphics/entity/steam-engine/steam-engine-vertical-mask.png',
                width = 225,
                height = 391,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(4.75, -6.25),
                tint = tint,
                scale = 0.5,
            },
            -- Highlights
            {
                filename = '__redmew-data__/graphics/entity/steam-engine/steam-engine-vertical-highlights.png',
                width = 225,
                height = 391,
                frame_count = 32,
                line_length = 8,
                shift = util.by_pixel(4.75, -6.25),
                blend_mode = 'additive',
                scale = 0.5,
            },
            -- Shadow
            {
                filename = '__base__/graphics/entity/steam-engine/steam-engine-V-shadow.png',
                width = 330,
                height = 307,
                frame_count = 32,
                line_length = 8,
                draw_as_shadow = true,
                shift = util.by_pixel(40.5, 9.25),
                scale = 0.5,
            },
        },
    }
end

reskin_library.make_electric_mining_drill_tint_layers = function(entity, tint)
    local source = data.raw['mining-drill']['electric-mining-drill']
    entity.graphics_set = table.deepcopy(source.graphics_set)
    entity.wet_mining_graphics_set = table.deepcopy(source.wet_mining_graphics_set)

    local function make_tint_layers(parent, key)
        local layers = parent[key].layers or { parent[key] }
        local layer = table.deepcopy(layers[1])

        local mask = table.deepcopy(layer)
        mask.tint = tint
        mask.filename = mask.filename:gsub('.png', '-mask.png')
        mask.filename = mask.filename:gsub('__base__', '__redmew-data__')
        table.insert(layers, mask)

        local highlights = table.deepcopy(layer)
        highlights.tint = tint
        highlights.filename = highlights.filename:gsub('.png', '-highlights.png')
        highlights.filename = highlights.filename:gsub('__base__', '__redmew-data__')
        highlights.blend_mode = 'additive'
        table.insert(layers, highlights)

        parent[key] = { layers = layers }
    end

    -- electric-mining-drill-horizontal-front.png
    make_tint_layers(entity.graphics_set.working_visualisations[6], 'east_animation')
    make_tint_layers(entity.graphics_set.working_visualisations[6], 'west_animation')
    make_tint_layers(entity.wet_mining_graphics_set.working_visualisations[9], 'east_animation')
    make_tint_layers(entity.wet_mining_graphics_set.working_visualisations[9], 'west_animation')

    -- electric-mining-drill.png
    make_tint_layers(entity.graphics_set.working_visualisations[3], 'north_animation')
    make_tint_layers(entity.graphics_set.working_visualisations[3], 'south_animation')
    make_tint_layers(entity.wet_mining_graphics_set.working_visualisations[3], 'north_animation')
    make_tint_layers(entity.wet_mining_graphics_set.working_visualisations[3], 'south_animation')

    -- electric-mining-drill-horizontal.png
    make_tint_layers(entity.graphics_set.working_visualisations[3], 'east_animation')
    make_tint_layers(entity.graphics_set.working_visualisations[3], 'west_animation')
    make_tint_layers(entity.wet_mining_graphics_set.working_visualisations[3], 'east_animation')
    make_tint_layers(entity.wet_mining_graphics_set.working_visualisations[3], 'west_animation')
end

reskin_library.make_assembling_machine_tint_layers = function(entity, tint)
    reskin_library.make_assembling_machine_pipe_picture(entity.fluid_boxes, tint)
    local animation = table.deepcopy(entity.graphics_set.animation.layers[1])
    reskin_library.make_tint_layers{
        layers = entity.graphics_set.animation.layers,
        filepath = '__redmew-data__/graphics/entity/assembling-machine/assembling-machine',
        tint = tint,
        repeat_count = 32
    }
    table.insert(entity.graphics_set.animation.layers, 1, animation)
end

reskin_library.make_1x1_loader_tint_layers = function(entity, tint)
    entity.structure = {}
    entity.structure.direction_in = {
        sheets = {
            {
                filename = '__redmew-data__/graphics/entity/loader/loader.png',
                priority = 'extra-high',
                shift = { 0.15625, 0.0703125 },
                width = 106,
                height = 85,
                y = 85,
                scale = 0.5,
            },
            {
                filename = '__redmew-data__/graphics/entity/loader/loader-mask.png',
                priority = 'extra-high',
                shift = { 0.15625, 0.0703125 },
                width = 106,
                height = 85,
                y = 85,
                scale = 0.5,
                tint = tint,
            },
            {
                filename = '__redmew-data__/graphics/entity/loader/loader-rust.png',
                priority = 'extra-high',
                shift = { 0.15625, 0.0703125 },
                width = 106,
                height = 85,
                y = 85,
                scale = 0.5,
            },
        },
    }
    entity.structure.direction_out = {
        sheets = {
            {
                filename = '__redmew-data__/graphics/entity/loader/loader.png',
                priority = 'extra-high',
                shift = { 0.15625, 0.0703125 },
                width = 106,
                height = 85,
                scale = 0.5,
            },
            {
                filename = '__redmew-data__/graphics/entity/loader/loader-mask.png',
                priority = 'extra-high',
                shift = { 0.15625, 0.0703125 },
                width = 106,
                height = 85,
                scale = 0.5,
                tint = tint,
            },
            {
                filename = '__redmew-data__/graphics/entity/loader/loader-rust.png',
                priority = 'extra-high',
                shift = { 0.15625, 0.0703125 },
                width = 106,
                height = 85,
                scale = 0.5,
            },
        },
    }
end

reskin_library.switch_prototype = function(prototype, obj)
    local tint = obj._tint
    local reskin_type = obj._reskin
    
    if prototype.type == 'technology' then
        prototype.icon = nil
        prototype.icons = reskin_library.make_technology_icons(reskin_type, tint)
        return
    end

    prototype.icon = nil
    prototype.icons = reskin_library.make_item_icons(reskin_type, tint)

    local filepath = '__redmew-data__/graphics/entity/'..reskin_type..'/'..reskin_type

    if reskin_type == 'assembling-machine' then
        reskin_library.make_assembling_machine_tint_layers(prototype, tint)
    elseif reskin_type == 'chemical-plant' then
        reskin_library.make_tint_layers_4_ways{ layers = prototype.graphics_set.animation, filepath = filepath, tint = tint }
    elseif reskin_type == 'oil-refinery' then
        reskin_library.make_tint_layers_4_ways{ layers = prototype.graphics_set.animation, filepath = filepath, tint = tint }
    elseif reskin_type == 'electric-furnace' then
        reskin_library.make_tint_layers{ layers = prototype.graphics_set.animation.layers, filepath = filepath, tint = tint }
    elseif reskin_type == 'electric-mining-drill' then
        reskin_library.make_electric_mining_drill_tint_layers(prototype, tint)
    elseif reskin_type == 'nuclear-reactor' then
        reskin_library.make_tint_layers{ layers = prototype.picture.layers, filepath = filepath, tint = tint }
    elseif reskin_type == 'heat-exchanger' then
        reskin_library.make_boiler_tint_layers{ layers = prototype.pictures, filepath = filepath, tint = tint }
    elseif reskin_type == 'steam-turbine' then
        reskin_library.make_steam_turbine_tint_layers(prototype, tint)
    elseif reskin_type == 'boiler' then
        reskin_library.make_boiler_tint_layers{ layers = prototype.pictures, filepath = filepath, tint = tint }
    elseif reskin_type == 'steam-engine' then
        reskin_library.make_steam_engine_tint_layers(prototype, tint)
    elseif reskin_type == 'loader-1x1' then
        reskin_library.make_1x1_loader_tint_layers(prototype, tint)
    end
end

--=================================================================================================

local function lr_hr_tint(obj, tint)
    if not obj then
        return
    end
    obj.tint = tint
    if obj.hr_version ~= nil then
        obj.hr_version.tint = tint
    end
end

local function tint_layers(obj, tint)
    if not obj then
        return
    end
    if obj.filename then
        lr_hr_tint(obj, tint)
    end
    if obj.layers and obj.layers[1] then
        lr_hr_tint(obj.layers[1], tint)
    end
    if obj.structure then
        tint_layers(obj.structure, tint)
    end
    for _, d in pairs({ 'north', 'east', 'south', 'west' }) do
        tint_layers(obj[d], tint)
    end
end

function apply_tint(obj, tint)
    if not obj or not tint or type(obj) ~= 'table' then
        return
    end
    obj.icons = { { icon = obj.icon, tint = tint } }
    tint_layers(obj.animation, tint)
    tint_layers(obj.horizontal_animation, tint)
    tint_layers(obj.vertical_animation, tint)
    tint_layers(obj.structure, tint)
    tint_layers(obj.patch, tint)
    tint_layers(obj.picture, tint)
    tint_layers(obj.pictures, tint)
    if obj.graphics_set then
        tint_layers(obj.graphics_set.animation, tint)
    end
    if obj.wet_mining_graphics_set then
        tint_layers(obj.wet_mining_graphics_set.animation, tint)
    end
    for _, fb in pairs(obj.fluid_boxes or {}) do
        if type(fb) == 'table' then
            tint_layers(fb.pipe_picture, tint)
        end
    end
    for _, wv in pairs(obj.working_visualisations or {}) do
        tint_layers(wv.animation, tint)
    end
end

local function r_copy(target, source)
    for k, v in pairs(source) do
        if tostring(k):find('^_') ~= 1 then
            if type(v) == 'table' then
                target[k] = target[k] or {}
                r_copy(target[k], source[k])
            else
                target[k] = source[k]
            end
        end
    end
end

--- Updates (overwriting) a given prototype's fields with the given data
---@param obj ConfigData
redmew.update_prototype = function(obj)
    if not obj or not obj.name or not obj.type then
        error('Invalid object')
        return
    end
    local p = data.raw[obj.type][obj.name]
    if not p then
        log('Could not update ' .. obj.name)
        return
    end
    r_copy(p, obj)
end

--- Creates a copy of the given prototype, using the additional fields to set new properties
---@param obj ConfigData
redmew.make_tier = function(obj)
    local base = table.deepcopy(data.raw[obj.type][obj._base])
    if not base then
        error('Could not find ' .. obj.type .. '/' .. obj._base)
        return
    end
    base.next_upgrade = nil
    r_copy(base, obj)
    if base.minable and base.minable.result then
        base.minable.result = base.name
    end

    if obj._reskin then
        reskin_library.switch_prototype(base, obj)
    elseif obj._tint and obj._tint ~= false then
        apply_tint(base, obj._tint)
    end

    return base
end

--=================================================================================================

local msv = redmew.string.msv
--- Loop through all prototypes of the same source.
--- Multiplies string values related to energy consumption by the given multiplier
---@param source string
---@param multiplier number
redmew.expensive_robot = function(source, multiplier)
    for _, e in pairs(data.raw[source]) do
        e.max_energy = msv(e.max_energy, multiplier)
        e.charging_energy = msv(e.charging_energy, multiplier)
        e.energy_per_tick = msv(e.energy_per_tick, multiplier)
        e.energy_per_move = msv(e.energy_per_move, multiplier)
        e.recharge_minimum = msv(e.recharge_minimum, multiplier)
        if e.energy_source then
            e.energy_source.buffer_capacity = msv(e.energy_source.buffer_capacity, multiplier)
            e.energy_source.input_flow_limit = msv(e.energy_source.input_flow_limit, multiplier)
        end
    end
end

--=================================================================================================

redmew.whitelist_waterfill_tiles = function(tiles_table)
    local waterfill = data.raw['selection-tool']['rm-waterfill']
    if not waterfill then
        return
    end
    if not (tiles_table and type(tiles_table) == 'table') then
        return
    end
    for _, name in pairs(tiles_table) do
        local t = data.raw.tile[name]
        if t then
            table.insert(waterfill.select.tile_filters, name)
            table.insert(waterfill.alt_select.tile_filters, name)
        else
            log('Could not whitelist ' .. name)
        end
    end
end

--=================================================================================================

local function hex2rgb(hex)
    hex = hex:gsub('#', '')
    return {
        r = tonumber('0x' .. hex:sub(1, 2)) / 255,
        g = tonumber('0x' .. hex:sub(3, 4)) / 255,
        b = tonumber('0x' .. hex:sub(5, 6)) / 255,
        a = tonumber('0x' .. (#hex == 8 and hex:sub(7, 8) or 'ff')) / 255,
    }
end

local function parse_color(color)
    if type(color) == 'string' then
        return hex2rgb(color)
    end
    local norm = 1
    if (color.r and color.r > 1) or (color[1] and color[1] > 1) then
        norm = 255
    end
    return {
        r = (color.r or color[1]) / norm,
        g = (color.g or color[2]) / norm,
        b = (color.b or color[3]) / norm,
        a = color.a or color[4] or 1,
    }
end

-- ADD friendly color to a type of prototypes (e.g. radar, roboport...)
redmew.type_friendly_color = function(source, color, friendly)
    local mode = (friendly == false and 'enemy_map_color') or 'friendly_map_color'
    if not color then
        return
    end
    local c = parse_color(color)
    local s = data.raw[source]
    if not s then
        return
    end
    for _, e in pairs(s) do
        e[mode] = c
        e.map_color = c
    end
end

-- ADD friendly color to a specific entity
redmew.entity_friendly_color = function(source, name, color, friendly)
    local mode = (friendly == false and 'enemy_map_color') or 'friendly_map_color'
    if not color then
        return
    end
    local c = parse_color(color)
    local s = data.raw[source]
    if not s then
        return
    end
    local e = s[name]
    if not e then
        return
    end
    e[mode] = c
    e.map_color = c
end

-- ADD friendly color to all protptypes with that name
redmew.friendly_color = function(name, color, friendly)
    local mode = (friendly == false and 'enemy_map_color') or 'friendly_map_color'
    if not color then
        return
    end
    local c = parse_color(color)
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
        'loader-1x1',
        'loader',
        'logistic-container',
        'mining-drill',
        'pipe-to-ground',
        'pipe',
        'pump',
        'radar',
        'rail',
        'reactor',
        'roboport',
        'rocket-silo',
        'simple-entity',
        'solar-panel',
        'splitter',
        'storage-tank',
        'transport-belt',
        'tree',
        'underground-belt',
        'wall',
    }) do
        local e = data.raw[source] and data.raw[source][name]
        if e then
            e[mode] = c
            e.map_color = c
        end
    end
end
