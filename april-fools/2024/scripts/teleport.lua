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

local function on_lua_shortcut(event)
  local player = game.get_player(event.player_index)
  if not (player and player.valid) then
    return
  end

  local shortcut = event.prototype_name or event.input_name
  if shortcut ~= 'teleport-up' and shortcut ~= 'teleport-down' then
    return
  end

  local src = player.surface
  local dst = get_opposite_surface(src)
  local src_pos = player.position
  local dst_pos = dst.find_non_colliding_position('character', src_pos, 7, 1)

  if dst_pos then
    player.teleport(dst_pos, dst, true)
  else
    player.create_local_flying_text{
      text = 'Cannot teleport, something is in the way...',
      position = src_pos,
      color = player.color,
    }
    player.play_sound{path = 'utility/cannot_build' }
  end
end

--=================================================================================================

local this = {}

this.events = {
  [defines.events.on_lua_shortcut] = on_lua_shortcut,
  ['teleport-down'] = on_lua_shortcut,
  ['teleport-up'] = on_lua_shortcut,
}

return this