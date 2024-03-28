local pole_type = 'medium-electric-pole'

local function on_init()
  global.tunnels = {}
  global.count = 0 -- UID, must always increase
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
  local src = game.get_surface(type(surface) == 'table' and surface.name or surface)
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
  local entity = event.created_entity
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

    global.count = global.count + 1
    global.tunnels[global.count] = {
      [src.name] = entity,
      [dst.name] = dst_entity,
    }
    entity.link_id = global.count
    dst_entity.link_id = global.count

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

    src_pole.connect_neighbour(dst_pole)
    src_pole.connect_neighbour({
      wire = defines.wire_type.red,
      target_entity = dst_pole
    })
    src_pole.connect_neighbour({
      wire = defines.wire_type.green,
      target_entity = dst_pole
    })

    src_pole.destructible = false
    src_pole.minable = false
    dst_pole.destructible = false
    dst_pole.minable = false

    game.print({'alert.tunnel_built', position.x, position.y, src.name, dst.name})
  else
    local stack = event.stack
    local player = game.get_player(event.player_index or 'none')
    local robot = event.robot
    if player and player.valid and not ghost and stack.valid then
      if player.can_insert(stack) then
        player.insert(stack)
      end
      player.print({'alert.tunnel_error', position.x, position.y, src.name, dst.name})
    elseif robot and robot.valid and not ghost and stack.valid then
      -- FIXME: currenlty not refunding with robots...
      if robot.can_insert(stack) then
        robot.insert(stack)
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
  local tunnels = global.tunnels[id]
  local dst_entity = tunnels[dst.name]
  if dst_entity and dst_entity.valid then
    destroy_pole(dst_entity)
    dst_entity.destroy()
  end

  global.tunnels[id] = nil
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
  local tunnels = global.tunnels[id]
  local dst_entity = tunnels[dst.name]
  if dst_entity and dst_entity.valid then
    destroy_pole(dst_entity)
    dst_entity.destroy()
  end

  global.tunnels[id] = nil
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