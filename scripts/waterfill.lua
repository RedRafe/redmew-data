local REACH = 20
local TRUSTED_TIME = 15 * 60 * 60 -- 15 min

local function dist(pos1, pos2)
  local x1 = pos1.x or pos1[1]
  local y1 = pos1.y or pos1[2]
  local x2 = pos2.x or pos2[1]
  local y2 = pos2.y or pos2[2]
  return ((x1-x2)^2 + (y1-y2)^2)^0.5
end

local function flying_error(player, text)
  player.create_local_flying_text({
    color = {1, 0, 0, 0.5},
    create_at_cursor = true,
    position = player.position,
    text = text,
  })
  player.play_sound({ path = 'utility/cannot_build' })
end

local function edit(e)
    local player = game.get_player(e.player_index)
    local item = e.item
    if not player then return end
    if not (e.item == 'rm-waterfill') then return end
    if not player.admin and player.online_time < TRUSTED_TIME then
      flying_error(player, {'waterfill.trusted'})
      return
    end

    local area = e.area
    local pos = player.position
    local surface = e.surface
    local entities = surface.find_entities(area)
    if #entities > 0 then flying_error(player, {'waterfill.entities'}) return end

    local tiles = e.tiles
    local new_tiles = {}
    local too_far = 0
    local t = 0
    for ___, tile in pairs(tiles) do
      if dist(tile.position, pos) <= REACH then
        if (tile.name and tile.name == 'landfill') or (tile.hidden_tile and tile.hidden_tile == 'landfill') then
          t = t + 1
          new_tiles[t] = { name = 'water-mud', position = tile.position }
        end
      else
        too_far = too_far + 1
      end
    end

    if t == 0 and too_far == 0 then flying_error(player, {'waterfill.not_here'})
    elseif t == 0 and too_far > 0 then flying_error(player, {'waterfill.cannot_reach'})
    else
      surface.set_tiles(new_tiles)
    end
end

--=================================================================================================

---@type ScriptLib
local Waterfill = {}

Waterfill.events = {
  [defines.events.on_player_selected_area] = edit,
  [defines.events.on_player_alt_selected_area] = edit,
}

if settings.startup['do_enable_waterfill'] and settings.startup['do_enable_waterfill'].value then
  return Waterfill
else
  return {}
end