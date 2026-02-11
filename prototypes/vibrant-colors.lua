-- source: mods.factorio.com/mod/Vibrant_paint
if not settings.startup['redmew_vibrant_colors'].value then
    return
end

local function apply_function_to_layers(table_of_layers, function_name, extra_parameter)
    -- start from last layer, to first layer
    -- if runtime tint, duplicate it
    for _, layers in pairs(table_of_layers) do
        for i = #layers, 1, -1 do
            function_name(layers[i], layers, i, extra_parameter)
        end
    end
end

-- duplicate mask with additive to achieve greater saturation
local function duplicate_mask_layer(layer, parent, index, int_times)
    if layer.apply_runtime_tint and layer.apply_runtime_tint == true then
        for times = 1, (int_times or 1) do
            table.insert(parent, index + 1, layer)
        end
    end
end

-- Find a prototype's animation layers, returns a table of "layers" tables
local function find_animation_layers(prototype)
    local anim_layers = {}

    -- As a backup, will use prototype itself as anim table
    local anim_table = prototype

    -- If entity has more than one of these, only the first will get fixed!
    if prototype.top_animations then
        anim_table = prototype.top_animations --
    elseif prototype.graphics_set then
        anim_table = prototype.graphics_set -- for spider and legs
    elseif prototype.animations then
        if prototype.animations.north then -- for train stop
            table.insert(anim_layers, prototype.animations.north.layers)
        else
            anim_table = prototype.animations -- for engineer characters. Note that cars also have this, and so therefore so do DMV spider-vehicles. This will get caught if it's before graphics_set!
        end
        if prototype.animations.south then
            table.insert(anim_layers, prototype.animations.south.layers)
        end
        if prototype.animations.east then
            table.insert(anim_layers, prototype.animations.east.layers)
        end
        if prototype.animations.west then
            table.insert(anim_layers, prototype.animations.west.layers)
        end
    elseif prototype.capture_animations then
        anim_table = prototype.capture_animations -- for capture robots
    elseif prototype.animation then
        anim_table = prototype.animation
        --elseif prototype.pictures then -- removing this check fixes cargo wagon
        --	anim_table = prototype.pictures
    end

    -- Check for Turret animation
    if prototype.turret_animation then
        if prototype.turret_animation.layers then
            table.insert(anim_layers, prototype.turret_animation.layers)
        end
    end

    -- Look deeply through the anim_table to find tables of layers
    if anim_table.layers then
        table.insert(anim_layers, anim_table.layers)
    else
        -- we haven't dug deep enough to get to layers yet.
        for _, anim_table_2 in pairs(anim_table) do
            if type(anim_table_2) == 'table' and anim_table_2.layers then
                table.insert(anim_layers, anim_table_2.layers)
            elseif type(anim_table_2) == 'table' then
                -- still not deep enough
                for _, anim_table_3 in pairs(anim_table_2) do
                    if type(anim_table_3) == 'table' and anim_table_3.layers then
                        table.insert(anim_layers, anim_table_3.layers)
                    elseif type(anim_table_3) == 'table' then
                        -- still not deep enough
                        for _, anim_table_4 in pairs(anim_table_3) do
                            if type(anim_table_4) == 'table' and anim_table_4.layers then
                                table.insert(anim_layers, anim_table_4.layers)
                            elseif type(anim_table_4) == 'table' then
                                -- still not deep enough
                                for _, anim_table_5 in pairs(anim_table_4) do
                                    if type(anim_table_5) == 'table' and anim_table_4.layers then
                                        table.insert(anim_layers, anim_table_5.layers)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    return anim_layers
end

-----------------------------------------------------------------------
--  Check every prototype we're interested in and try to saturate it.
-----------------------------------------------------------------------
for _, data_type in ipairs({
    'character',
    'character-corpse',

    'cargo-wagon',
    'locomotive',
    'fluid-wagon',
    'train-stop',

    'combat-robot',
    'ammo-turret',
    'electric-turret',
    'fluid-turret',
    'car',
    'spider-vehicle',
    'spider-leg',

    'corpse',
}) do
    for _, prototype in pairs(data.raw[data_type]) do
        if string.match(prototype.name, '%-warden') then
            -- Warden mask needs even more painting
            apply_function_to_layers(find_animation_layers(prototype), duplicate_mask_layer, 4)
        elseif string.match(prototype.type, 'cargo%-wagon') then
            -- If you paint a cargo wagon pictures twice,
            -- weird things happen with the doors on top when it's vertical
            apply_function_to_layers(find_animation_layers(prototype), duplicate_mask_layer, 1)
        else
            apply_function_to_layers(find_animation_layers(prototype), duplicate_mask_layer, 2)
        end
    end
end

-- We only need THREE projectiles painted:
apply_function_to_layers(find_animation_layers(data.raw['projectile']['distractor-capsule']), duplicate_mask_layer, 2)
if mods['space-age'] then
    apply_function_to_layers(find_animation_layers(data.raw['capture-robot']['capture-robot']), duplicate_mask_layer, 2)
    apply_function_to_layers(find_animation_layers(data.raw['projectile']['capture-robot-rocket']), duplicate_mask_layer, 2)
end

for _, data_type in ipairs({
    'car',
    'spider-vehicle',
}) do
    for _, vehicle in pairs(data.raw[data_type]) do
        if string.match(vehicle.name, '%-warden') then
            -- New Warden painted remnants
            vehicle.corpse = { 'locomotive-remnants', 'car-remnants' }
        end

        -- New Flame Tank painted remnant
        if string.match(vehicle.name, 'flame%-tank') then
            vehicle.corpse = { 'flamethrower-turret-remnants', 'tank-remnants' }
        end

        -- New Laser Tank painted remnant
        if string.match(vehicle.name, 'laser%-tank') then
            vehicle.corpse = { 'laser-turret-remnants', 'tank-remnants' }
        end

        -- New Ironclad painted remnant
        if string.match(vehicle.name, 'ironclad') then
            vehicle.corpse = { 'flamethrower-turret-remnants', 'locomotive-remnants' }
        end
    end
end
