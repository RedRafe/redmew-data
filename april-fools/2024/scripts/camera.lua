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
  if shortcut ~= 'camera' then
    return
  end

end

--=================================================================================================

local this = {}

this.events = {
  [defines.events.on_lua_shortcut] = on_lua_shortcut,
  ['camera'] = on_lua_shortcut,
}

return this