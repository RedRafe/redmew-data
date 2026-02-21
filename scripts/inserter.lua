local INSERTERS_MAP = prototypes.mod_data['redmew-data'].data.inserters or {}
if table_size(INSERTERS_MAP) == 0 then
    return
end

local main_frame_name = '__redmew-data__/scripts/inserter/main_frame_name'
local switch_name = '__redmew-data__/scripts/inserter/switch_name'

-- 'redmew-' inserters do not wait for full stack
local function is_waiting(entity)
    local name = entity.name
    if name == 'entity-ghost' then
        name = entity.ghost_name
    end
    return string.match(name, '^redmew%-')
end

local function replace(old)
    return old.surface.create_entity{
        name = (old.name == 'entity-ghost') and 'entity-ghost' or INSERTERS_MAP[old.name],
        inner_name = (old.name == 'entity-ghost') and INSERTERS_MAP[old.ghost_name] or nil,
        position = old.position,
        direction = old.direction,
        quality = old.quality,
        force = old.force,
        create_build_effect_smoke = false,
        spawn_decorations = false,
        raise_built = true,
        fast_replace = true,
        spill = false,
    }
end

--- @param player LuaPlayer
--- @param entity LuaEntity
local function create_gui(player, entity)
    local window = player.gui.relative[main_frame_name]
    if window then
        window.destroy()
    end

    player.gui.relative
        .add({
            type = 'frame',
            name = main_frame_name,
            style = 'non_draggable_frame',
            caption = 'Wait for full stack',
            anchor = {
                gui = defines.relative_gui_type.inserter_gui,
                position = defines.relative_gui_position.right,
            },
        })
        .add({
            type = 'frame',
            style = 'inside_shallow_frame_with_padding',
        })
        .add({
            type = 'switch',
            name = switch_name,
            left_label_caption = 'Always',
            right_label_caption = 'Never',
            switch_state = is_waiting(entity) and 'right' or 'left',
        })
end

local function validate_gui(event)
    local player = game.get_player(event.player_index)
    if not (player and player.valid) then
        return nil, nil
    end

    if player.opened_gui_type ~= defines.gui_type.entity then
        return nil, nil
    end

    local entity = player.opened
    if not (entity and entity.valid) then
        return nil, nil
    end

    local name = entity.name
    if name == 'entity-ghost' then
        name = entity.ghost_name
    end
    if not INSERTERS_MAP[name] then
        return nil, nil
    end

    return player, entity
end

local function on_gui_opened(event)
    local player, entity = validate_gui(event)
    if not (player and entity) then
        return
    end

    create_gui(player, entity)
end

local function on_gui_switch_state_changed(event)
    if event.element.name ~= switch_name then
        return
    end

    local player, old = validate_gui(event)
    if not player then
        return
    end

    local new = replace(old, player.index)
    if not (new and new.valid) then
        return
    end

    player.opened = new
    create_gui(player, new)
end

local function on_entity_settings_pasted(event)
    local src = event.source
    local dst = event.destination

    local src_id = src.name == 'entity-ghost' and src.ghost_name or src.name
    local dst_id = INSERTERS_MAP[dst.name == 'entity-ghost' and dst.ghost_name or dst.name]
    if src_id ~= dst_id then
        return
    end

    replace(dst)
end

local function on_configuration_changed()
    for _, player in pairs(game.players) do
        local frame = player.gui.relative[main_frame_name]
        if frame then
            frame.destroy()
        end
    end
end

redmew.add_library {
    on_configuration_changed = on_configuration_changed,
    events = {
        [defines.events.on_gui_opened] = on_gui_opened,
        [defines.events.on_gui_switch_state_changed] = on_gui_switch_state_changed,
        [defines.events.on_entity_settings_pasted] = on_entity_settings_pasted,
    },
}
