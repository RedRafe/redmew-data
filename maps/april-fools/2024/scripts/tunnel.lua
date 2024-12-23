local pole_type = 'medium-electric-pole'

local function on_init()
  storage.tunnels = {}
  storage.count = 0 -- UID, must always increase
end

local function destroy_pole(entity)
  if not (entity and entity.surface and entity.position) then
    return
  end

  local pole = entity.surface.find_entities_filtered{
    position = entity.position,
    name = pole_type,
    radius = 2
  }

  if pole and pole[1] and pole[1].valid then
    pole[1].destroy()
  end
end

---@param surface SurfaceIdentification union LuaSurface|string
local function get_opposite_surface(surface)
  local src = game.get_surface(type(surface) == 'userdata' and surface.name or surface)
  local mines = game.get_surface('mines')
  local islands = game.get_surface('islands')

  if not islands or not mines or not src then
    return
  end

  if src.name == mines.name then return islands end
  if src.name == islands.name then return mines end
  return
end

local function on_tunnel_built(event)
  local entity = event.created_entity or event.entity
  if not (entity and entity.valid and entity.name == 'tunnel') then
    return
  end

  local name = entity.name
  local ghost = false
  if name == 'entity-ghost' then
    name = entity.ghost_name
    ghost = true
  end

  local src = entity.surface
  local dst = get_opposite_surface(src.name)
  local position = entity.position

  -- check other surface
  dst.request_to_generate_chunks(position, 1)
  dst.force_generate_chunk_requests()

  if dst.can_place_entity{name = 'tunnel', position = position} then
    local dst_entity = dst.create_entity{
      name = 'tunnel',
      position = position,
      raise_built = false,
      force = entity.force,
      create_build_effect_smoke = true,
      move_stuck_players = true
    }

    storage.count = storage.count + 1
    storage.tunnels[storage.count] = {
      [src.name] = entity,
      [dst.name] = dst_entity,
    }
    entity.link_id = storage.count
    dst_entity.link_id = storage.count
    
    local src_pole = src.create_entity{
      name = pole_type,
      force = entity.force,
      position = entity.position,
    }

    local dst_pole = dst.create_entity{
      name = pole_type,
      force = entity.force,
      position = entity.position,
    }

    for _, wire_id in pairs({
      defines.wire_connector_id.pole_copper,
      defines.wire_connector_id.circuit_red,
      defines.wire_connector_id.circuit_green,
    }) do
      src_pole.get_wire_connector(wire_id, true).connect_to(dst_pole.get_wire_connector(wire_id, true))
    end

    src_pole.destructible = false
    src_pole.minable_flag = false
    dst_pole.destructible = false
    dst_pole.minable_flag = false

    game.print({'alert.tunnel_built', position.x, position.y, src.name, dst.name})
  else
    local stack = event.stack
    local player = game.get_player(event.player_index or 'none')
    local robot = event.robot
    if player and player.valid and not ghost and event.consumed_items.valid then
      for _, stack in pairs(event.consumed_items.get_contents()) do
        if player.can_insert(stack) then
          player.insert(stack)
        end
      end
      player.print({'alert.tunnel_error', position.x, position.y, src.name, dst.name})
    elseif robot and robot.valid and not ghost and stack.valid then
      -- FIXME: currenlty not refunding with robots...
      for _, stack in pairs(event.consumed_items.get_contents()) do
        if robot.can_insert(stack) then
          robot.insert(stack)
        end
      end
      game.print({'alert.tunnel_error', position.x, position.y, src.name, dst.name})
    end
    entity.destroy()
  end
end

local function on_tunnel_mined(event)
  local entity = event.entity
  if not (entity and entity.valid and entity.name == 'tunnel') then
    return
  end

  -- refund contents
  local inventory = entity.get_output_inventory()
  if inventory and inventory.valid then
    local buffer = event.buffer
    for i=1, #inventory do
      buffer.insert(inventory[i])
    end
    inventory.clear()
  end

  local src = entity.surface
  local dst = get_opposite_surface(src)
  local position = entity.position

  destroy_pole(entity)

  game.print({'alert.tunnel_destroy', position.x, position.y, src.name, dst.name})

  -- destroy linked tunnel
  local id = entity.link_id
  local tunnels = storage.tunnels[id]
  if not tunnels then
    return
  end

  local dst_entity = tunnels[dst.name]
  if dst_entity and dst_entity.valid then
    destroy_pole(dst_entity)
    dst_entity.destroy()
  end

  storage.tunnels[id] = nil
end

local function on_tunnel_destroyed(event)
  local entity = event.entity
  if not (entity and entity.name == 'tunnel') then
    return
  end

  local src = entity.surface
  local dst = get_opposite_surface(src)
  local position = entity.position

  destroy_pole(entity)

  game.print({'alert.tunnel_destroy', position.x, position.y, src.name, dst.name})

  -- destroy linked tunnel
  local id = entity.link_id
  local tunnels = storage.tunnels[id]
  local dst_entity = tunnels[dst.name]
  if dst_entity and dst_entity.valid then
    destroy_pole(dst_entity)
    dst_entity.destroy()
  end

  storage.tunnels[id] = nil
end

--=================================================================================================

local this = {}

this.on_init = on_init

this.events = {
  [defines.events.on_built_entity] = on_tunnel_built,
  [defines.events.on_robot_built_entity] = on_tunnel_built,
  [defines.events.script_raised_built] = on_tunnel_built,
  [defines.events.on_player_mined_entity] = on_tunnel_mined,
  [defines.events.on_robot_mined_entity] = on_tunnel_mined,
  [defines.events.on_entity_died] = on_tunnel_destroyed,
}

return this