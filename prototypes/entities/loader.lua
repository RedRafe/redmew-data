local sounds = require '__base__.prototypes.entity.sounds'
local transport_belts = data.raw['transport-belt']

local config = {
    ['loader'] = {
        next_upgrade = 'redmew-fast-loader',
        technology = 'logistics',
        tint = { 249, 207, 70 },
        belt = 'transport-belt',
    },
    ['fast-loader'] = {
        next_upgrade = 'redmew-express-loader',
        technology = 'logistics-2',
        tint = { 228, 24, 38 },
        belt = 'fast-transport-belt',
    },
    ['express-loader'] = {
        technology = 'logistics-3',
        tint = { 90, 190, 220 },
        belt = 'express-transport-belt',
    },
}

if data.raw.loader['turbo-loader'] then
    config['express-loader'].next_upgrade = 'redmew-turbo-loader'
    config['turbo-loader'] = {
        technology = 'turbo-transport-belt',
        tint = { 76, 232, 48 },
        belt = 'turbo-transport-belt',
    }
end

local function make_item(name, info)
    local item = redmew.make_tier{
        type = 'item',
        _base = name,
        name = info.name,
        place_result = info.name,
        hidden = false,
        subgroup = 'belt',
    }
    item.order = 'redmew-'..item.order
    item.icons = nil
    item.icon = '__redmew-data__/graphics/icons/loader/'..name..'.png'
    return item
end

local function make_recipe(name, info)
    local recipe = redmew.make_tier{
        type = 'recipe',
        _base = name,
        name = info.name,
        hidden = false,
        enabled = false,
    }
    recipe.results = {{ name = info.name, type = 'item', amount = 1 }}
    return recipe
end

local function make_entity(name, info)
    local entity = redmew.make_tier({
        _base = name,
        _reskin = 'loader-1x1',
        _tint = info.tint,
        close_sound = sounds.machine_close,
        collision_box = { { -0.4, -0.45 }, { 0.4, 0.45 } },
        container_distance = 0.75,
        corpse = 'small-remnants',
        fast_replaceable_group = 'transport-belt',
        hidden = false,
        localised_name = {'entity-name.'..name},
        name = info.name,
        next_upgrade = info.next_upgrade,
        open_sound = sounds.machine_open,
        placeable_by = { item = info.name, count = 1 },
        selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        structure_render_layer = 'object',
        type = 'loader',
    })
    entity.type = 'loader-1x1'
    entity.belt_animation_set = transport_belts[info.belt].belt_animation_set
    entity.icons = nil
    entity.icon = '__redmew-data__/graphics/icons/loader/'..name..'.png'
    return entity
end

local previous_name
local previous_new_name
for name, info in pairs(config) do
    info.name = 'redmew-'..name
    data:extend({
        make_item(name, info),
        make_recipe(name, info),
        make_entity(name, info),
    })
    redmew.add_unlock(info.technology, info.name)

    if previous_name then
        redmew.replace_ingredient(info.name, previous_name, previous_new_name, 1, false)
    end
    previous_name = name
    previous_new_name = info.name
end
