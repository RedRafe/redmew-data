--- Credits to Raiguard / Krastorio2
--- source: https://codeberg.org/raiguard/Krastorio2/src/branch/trunk/scripts/loader-snapping.lua#
-- ============================================================================

if not prototypes.entity['redmew-loader'] then
    return
end

--- @type table<defines.direction, Vector>
local offsets = {
    [defines.direction.north] = {  0, -1 },
    [defines.direction.east]  = {  1,  0 },
    [defines.direction.south] = {  0,  1 },
    [defines.direction.west]  = { -1,  0 },
}

local belt_types = {
    'linked-belt',
    'loader',
    'loader-1x1',
    'splitter',
    'transport-belt',
    'underground-belt',
}

local container_types = {
    'assembling-machine',
    'beacon',
    'boiler',
    'burner-generator',
    'container',
    'curved-rail',
    'furnace',
    'infinity-container',
    'lab',
    'linked-container',
    'logistic-container',
    'mining-drill',
    'proxy-container',
    'rail',
    'reactor',
    'rocket-silo',
    'straight-rail',
}

--- Calculate the opposite direction.
---@param direction defines.direction
---@return defines.direction
local function direction_opposite(direction)
    return (direction + 8) % 16 --[[@as defines.direction]]
end

--- Add two positions.
---@generic P
---@param pos1 P
---@param pos2 P
---@return P
local function position_add(pos1, pos2)
    local x1 = pos1.x or pos1[1]
    local y1 = pos1.y or pos1[2]
    local x2 = pos2.x or pos2[1]
    local y2 = pos2.y or pos2[2]
    if pos1.x then
        return { x = x1 + x2, y = y1 + y2 }
    else
        return { x1 + x2, y1 + y2 }
    end
end

---@param entity LuaEntity
local function flip_loader(entity)
    entity.direction = direction_opposite(entity.direction)
    entity.loader_type = entity.loader_type == 'output' and 'input' or 'output'
end

--- Find entities and entity ghosts of the corresponding types.
---@param surface LuaSurface
---@param position MapPosition
---@param force ForceID
---@param types string[]
---@return LuaEntity[]
local function find_entities(surface, position, force, types)
    local entities = surface.find_entities_filtered({
        force = force,
        position = position,
        type = types,
    })
    local ghosts = surface.find_entities_filtered({
        force = force,
        ghost_type = types,
        position = position,
    })
    for i = 1, #ghosts do
        entities[#entities + 1] = ghosts[i]
    end
    return entities
end

--- Ensure that the loader has the belt on the correct side.
---@param entity LuaEntity
local function snap_direction(entity)
    local offset_direction = entity.direction
    if entity.loader_type == 'input' then
        offset_direction = direction_opposite(offset_direction)
    end
    local container_position = position_add(entity.position, offsets[offset_direction])

    -- Case 1: If a container is in front, then flip the loader
    local containers = find_entities(entity.surface, container_position, entity.force, container_types)
    if #containers > 0 then
        -- Check that it's not a composite loader entity
        local is_composite = entity.surface.count_entities_filtered({
            force = entity.force,
            position = container_position,
            type = { 'loader', 'loader-1x1' },
        }) > 0
        if not is_composite then
            flip_loader(entity)
            return
        end
    end

    -- Case 2: If a belt is behind, then flip the loader
    offset_direction = direction_opposite(offset_direction)
    local belt_position = position_add(entity.position, offsets[offset_direction])
    local belt = find_entities(entity.surface, belt_position, entity.force, belt_types)[1]
    if not belt then
        return
    end

    local belt_type = belt.type
    if belt_type == 'entity-ghost' then
        belt_type = belt.ghost_type
    end
    if belt_type == 'transport-belt' or belt_type == 'underground-belt' or math.abs(offset_direction - belt.direction) % 4 == 0 then
        flip_loader(entity)
    end
end

---@param entity LuaEntity
local function snap_to_belt(entity)
    local offset_direction = entity.direction
    if entity.loader_type == 'input' then
        offset_direction = direction_opposite(offset_direction)
    end
    local belt_position = position_add(entity.position, offsets[offset_direction])

    local belt = find_entities(entity.surface, belt_position, entity.force, belt_types)[1]
    if not belt then
        return
    end

    local belt_direction = belt.direction
    local belt_type = belt.type
    if belt_type == 'entity-ghost' then
        belt_type = belt.ghost_type
    end
    if entity.direction == belt_direction then
    -- Pass
    elseif entity.direction == direction_opposite(belt_direction) then
        entity.loader_type = 'input'
    elseif belt_type == 'transport-belt' or belt_type == 'underground-belt' then
        -- Sideloading
        entity.loader_type = 'output'
    end
end

---@param event EntityBuiltEvent
local function on_entity_built(event)
    local entity = event.entity or event.destination
    if not entity.valid or not string.match(entity.name, '^redmew.*%-loader$') then
        return
    end

    entity.update_connections()
    if not entity.loader_container then
        snap_direction(entity)
    end

    snap_to_belt(entity)
end

redmew.add_library {
    events = {
        [defines.events.on_built_entity] = on_entity_built,
        [defines.events.on_entity_cloned] = on_entity_built,
        [defines.events.on_robot_built_entity] = on_entity_built,
        [defines.events.script_raised_built] = on_entity_built,
        [defines.events.script_raised_revive] = on_entity_built,
        [defines.events.on_space_platform_built_entity] = on_entity_built,
    }
}
