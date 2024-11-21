-- Credits to Krastorio2 mod
-- calling the interface unfortunately didn't work well in scenarios
-- source: https://github.com/raiguard/Krastorio2/blob/master/scripts/creep.lua 

local SCAN_LIMIT = 1
local MIN_R, MAX_R = 5, 7
local SPAWN_X = 11 * 32 + 96

remote.add_interface('redmew-data', {
  get_spawn_x = function() return storage.spawn_x end,
  set_spawn_x = function(x) storage.spawn_x = x end,
})

--- @param entities LuaEntity[]
local function generate_creep(entities)
  local surface = entities[1].surface
  local radius = math.random(MIN_R, MAX_R)
  local to_add = {}
  local i = 0
  for _, entity in pairs(entities) do
    for _, tile in pairs(surface.find_tiles_filtered({ position = entity.position, radius = radius })) do
      if not tile.collides_with('player') and tile.position.x > storage.spawn_x then
        i = i + 1
        to_add[i] = { name = 'kr-creep', position = tile.position }
      end
    end
  end
  surface.set_tiles(to_add)
end

local function setup()
  storage.chunk = storage.chunk or {}
  storage.queue = storage.queue or {}
  storage.spawn_x = storage.spawn_x or SPAWN_X
end

local function on_nth_tick()
  for x, _gq in pairs(storage.queue) do
    for y, i_surface in pairs(_gq) do
      local area = { left_top = { x=32*x, y=32*y }, right_bottom = { x=32*x+32, y=32*y+32} }
      local entities = game.get_surface(i_surface).find_entities_filtered({ type = { 'unit-spawner' }, area = area, force = 'enemy' })
      for _, entity in pairs(entities) do
        if entity.valid then
          generate_creep({ entity })
        end
      end
      storage.queue[x][y] = nil
      storage.chunk[x] = storage.chunk[x] or {}
      storage.chunk[x][y] = (storage.chunk[x][y] or 0) + 1
    end
  end
end

--- @param chunk_area BoundingBox
--- @param position ChunkPosition 
--- @param surface_index uint
local function on_chunk_charted(e)
  local position = e.position
  if not position then error() end
  local x, y = position.x or position[1], position.y or position[2]

  if (storage.chunk[x] and storage.chunk[x][y] and (storage.chunk[x][y] > SCAN_LIMIT)) then return 
  elseif (storage.queue[x] and storage.queue[x][y]) then return 
  else 
    storage.queue[x] = storage.queue[x] or {}
    storage.queue[x][y] = e.surface_index
  end
end

--- @param area BoundingBox
--- @param position MapPosition
--- @param surface LuaSurface
--- @param name defines.events.on_chunk_generated
--- @param tick uint
function on_chunk_generated(e)
  local area = e.area
  local surface = e.surface
  local entities = surface.find_entities_filtered({ type = { 'unit-spawner' }, area = area, force = 'enemy' })
  for _, entity in pairs(entities) do
    if entity.valid then
      generate_creep({ entity })
    end
  end
end

--- @param entity LuaEntity
--- @param name defines.event.script_raised_built
--- @param tick uint
local function on_entity_created(e)
  local entity = e.entity
  if not entity or not entity.valid then return end
  if entity.type ~= 'unit-spawner' then return end
  generate_creep({ entity })
end

--- @param effect_id String
--- @param surface_index uint
--- @param source_position MapPosition
--- @param source_entity LuaEntity
--- @param target_position MapPosition
--- @param target_entity LuaEntity
--- @param name defines.event.on_script_trigger_effect
--- @param tick uint
local function on_trigger_entity(e)
  if e.effect_id ~= 'unit-spawner-built' then return end
  local entity = e.target_entity
  if not entity or not entity.valid then return end
  generate_creep({ entity })
end

--=================================================================================================

---@type ScriptLib
local Creep = {}

Creep.on_init = setup
Creep.on_configuration_changed = setup

Creep.on_nth_tick = { 
  [60] = on_nth_tick
}

Creep.events = {
  [defines.events.on_chunk_charted] = on_chunk_charted,
  [defines.events.on_chunk_generated] = on_chunk_generated,
  [defines.events.on_biter_base_built] = on_entity_created,
  [defines.events.script_raised_built] = on_entity_created,
  [defines.events.on_script_trigger_effect] = on_trigger_entity
}

return Creep