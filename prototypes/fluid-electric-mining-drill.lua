local hit_effects = require '__base__.prototypes.entity.hit-effects'
local sounds = require '__base__.prototypes.entity.sounds'
local graphics = {}

function graphics.smoke()
    return {
        priority = 'high',
        filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-smoke.png',
        line_length = 6,
        width = 48,
        height = 72,
        frame_count = 30,
        animation_speed = electric_drill_animation_speed,
        direction_count = 1,
        shift = util.by_pixel(0, 3),
        scale = 0.5,
    }
end

function graphics.smoke_front()
    return {
        priority = 'high',
        filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-smoke-front.png',
        line_length = 6,
        width = 148,
        height = 132,
        frame_count = 30,
        animation_speed = electric_drill_animation_speed,
        direction_count = 1,
        shift = util.by_pixel(-3, 9),
        scale = 0.5,
    }
end

function graphics.shadow_animation()
    return {
        priority = 'high',
        filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-shadow.png',
        line_length = 7,
        width = 232,
        height = 50,
        frame_count = 21,
        animation_speed = electric_drill_animation_speed,
        frame_sequence = electric_drill_animation_shadow_sequence,
        draw_as_shadow = true,
        shift = util.by_pixel(49, 7),
        scale = 0.5,
    }
end

function graphics.horizontal_shadow_animation()
    return {
        priority = 'high',
        filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-horizontal-shadow.png',
        line_length = 7,
        width = 236,
        height = 138,
        frame_count = 21,
        animation_speed = electric_drill_animation_speed,
        frame_sequence = electric_drill_animation_shadow_sequence,
        draw_as_shadow = true,
        shift = util.by_pixel(48, 5),
        scale = 0.5,
    }
end

function graphics.mk2_animation()
    return {
        priority = 'high',
        filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill.png',
        line_length = 6,
        width = 194,
        height = 154,
        frame_count = 30,
        animation_speed = electric_drill_animation_speed,
        frame_sequence = electric_drill_animation_sequence,
        direction_count = 1,
        shift = util.by_pixel(0, -21),
        scale = 0.5,
    }
end

function graphics.mk2_horizontal_animation()
    return {
        priority = 'high',
        filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-horizontal.png',
        line_length = 6,
        width = 104,
        height = 178,
        frame_count = 30,
        animation_speed = electric_drill_animation_speed,
        frame_sequence = electric_drill_animation_sequence,
        direction_count = 1,
        shift = util.by_pixel(-3, -27),
        scale = 0.5,
    }
end

function graphics.horizontal_front_animation()
    return {
        priority = 'high',
        filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-horizontal-front.png',
        line_length = 6,
        width = 54,
        height = 136,
        frame_count = 30,
        animation_speed = electric_drill_animation_speed,
        frame_sequence = electric_drill_animation_sequence,
        direction_count = 1,
        shift = util.by_pixel(14, -23),
        scale = 0.5,
    }
end

function graphics.status_leds_working_visualisation()
    local led_blend_mode = nil -- 'additive'
    local led_tint = { 1, 1, 1, 0.5 }
    return {
        apply_tint = 'status',
        always_draw = true,
        draw_as_sprite = true,
        draw_as_light = true,
        north_animation = {
            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-N-light.png',
            width = 30,
            height = 32,
            blend_mode = led_blend_mode,
            tint = led_tint,
            shift = util.by_pixel(26, -69),
            scale = 0.5,
        },
        east_animation = {
            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-E-light.png',
            width = 32,
            height = 34,
            blend_mode = led_blend_mode,
            tint = led_tint,
            shift = util.by_pixel(41, -45),
            scale = 0.5,
        },
        south_animation = {
            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-S-light.png',
            width = 32,
            height = 30,
            blend_mode = led_blend_mode,
            tint = led_tint,
            shift = util.by_pixel(26, 10),
            scale = 0.5,
        },
        west_animation = {
            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-W-light.png',
            width = 32,
            height = 34,
            blend_mode = led_blend_mode,
            tint = led_tint,
            shift = util.by_pixel(-42, -45),
            scale = 0.5,
        },
    }
end

function graphics.shift_animation_waypoints()
    return {
        -- Movement should be between 0.3-0.5 distance
        -- Bounds -0.7 - 0.6
        north = {
            { 0, 0 },
            { 0, 0.4 },
            { 0, 0.1 },
            { 0, -0.25 },
            { 0, -0.5 },
            { 0, -0.2 },
            { 0, 0 },
            { 0, -0.4 },
            { 0, -0.1 },
            { 0, 0.2 },
            { 0, 0.6 },
            { 0, 0.3 },
            { 0, -0.1 },
            { 0, -0.4 },
            { 0, 0 },
            { 0, 0.3 },
        },
        -- Bounds -0.6 - 0.4
        east = {
            { 0, 0 },
            { 0.4, 0 },
            { 0.1, 0 },
            { -0.3, 0 },
            { -0.6, 0 },
            { -0.2, 0 },
            { 0.1, 0 },
            { -0.3, 0 },
            { 0, 0 },
            { -0.35, 0 },
            { -0.6, 0 },
            { -0.2, 0 },
            { 0.1, 0 },
            { -0.3, 0 },
        },
        -- Bounds -0.7 - 0.5
        south = {
            { 0, 0 },
            { 0, -0.4 },
            { 0, -0.1 },
            { 0, 0.2 },
            { 0, 0.5 },
            { 0, 0.3 },
            { 0, 0 },
            { 0, 0.4 },
            { 0, 0.1 },
            { 0, -0.2 },
            { 0, -0.6 },
            { 0, -0.3 },
            { 0, 0.1 },
            { 0, 0.4 },
            { 0, 0 },
            { 0, -0.3 },
        },
        -- Bounds -0.4 - 0.6
        west = {
            { 0, 0 },
            { -0.4, 0 },
            { -0.1, 0 },
            { 0.3, 0 },
            { 0.6, 0 },
            { 0.2, 0 },
            { -0.1, 0 },
            { 0.3, 0 },
            { 0, 0 },
            { 0.35, 0 },
            { 0.6, 0 },
            { 0.2, 0 },
            { -0.1, 0 },
            { 0.3, 0 },
        },
    }
end

data:extend({
    -- Recipe
    {
        type = 'recipe',
        name = 'fluid-electric-mining-drill',
        energy_required = 2,
        enabled = false,
        ingredients = {
            { type = 'item', name = 'electronic-circuit', amount = 3 },
            { type = 'item', name = 'iron-gear-wheel', amount = 5 },
            { type = 'item', name = 'iron-plate', amount = 10 },
        },
        results = { { type = 'item', name = 'fluid-electric-mining-drill', amount = 1 } },
    },
    -- Item
    {
        type = 'item',
        name = 'fluid-electric-mining-drill',
        icon = '__redmew-data__/graphics/icons/fluid-electric-mining-drill.png',
        subgroup = 'extraction-machine',
        order = 'a[items]-c[electric-mining-drill-mk2]',
        place_result = 'fluid-electric-mining-drill',
        stack_size = 50,
    },
    -- Entity
    {
        type = 'mining-drill',
        name = 'fluid-electric-mining-drill',
        icon = '__redmew-data__/graphics/icons/fluid-electric-mining-drill.png',
        flags = { 'placeable-neutral', 'player-creation' },
        minable = { mining_time = 0.5, result = 'fluid-electric-mining-drill' },
        fast_replaceable_group = 'electric-mining-drill',
        collision_box = { { -1.35, -1.35 }, { 1.35, 1.35 } },
        selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
        resource_categories = { 'basic-solid' },
        mining_speed = 0.5,
        resource_searching_radius = 2.49,
        vector_to_place_result = { 0, -1.85 },
        module_slots = 3,
        energy_source = {
            type = 'electric',
            emissions_per_minute = { pollution = 10 },
            usage_priority = 'secondary-input',
        },
        energy_usage = '90kW',
        input_fluid_box = {
            production_type = 'input-output',
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            volume = 200,
            pipe_connections = {
                { flow_direction = 'input-output', direction = defines.direction.west, position = { -1, 0 } },
                { flow_direction = 'input-output', direction = defines.direction.east, position = { 1, 0 } },
                { flow_direction = 'input-output', direction = defines.direction.south, position = { 0, 1 } },
            },
        },
        max_health = 300,
        corpse = 'electric-mining-drill-remnants',
        dying_explosion = 'electric-mining-drill-explosion',
        damaged_trigger_effect = hit_effects.entity(),
        resistances = {
            { type = 'physical', percent = 20 },
            { type = 'fire', percent = 20 },
            { type = 'impact', percent = 20 },
        },
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,
        vehicle_impact_sound = sounds.generic_impact,
        working_sound = {
            sound = {
                filename = '__base__/sound/electric-mining-drill.ogg',
                volume = 1.0,
                advanced_volume_control = { attenuation = 'exponential' },
            },
            max_sounds_per_prototype = 4,
            fade_in_ticks = 4,
            fade_out_ticks = 20,
        },
        graphics_set = {
            drilling_vertical_movement_duration = 10 / electric_drill_animation_speed,
            animation_progress = 1,
            min_animation_progress = 0,
            max_animation_progress = 30,

            status_colors = electric_mining_drill_status_colors(),

            circuit_connector_layer = 'object',
            circuit_connector_secondary_draw_order = { north = 14, east = 26, south = 26, west = 26 },

            animation = {
                north = {
                    layers = {
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-N.png',
                            line_length = 1,
                            width = 194,
                            height = 242,
                            frame_count = 1,
                            animation_speed = electric_drill_animation_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -12),
                            repeat_count = 5,
                            scale = 0.5,
                        },
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-N-output.png',
                            line_length = 5,
                            width = 72,
                            height = 66,
                            frame_count = 5,
                            animation_speed = electric_drill_animation_speed,
                            direction_count = 1,
                            shift = util.by_pixel(-1, -44),
                            scale = 0.5,
                        },
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-N-shadow.png',
                            line_length = 1,
                            width = 274,
                            height = 206,
                            frame_count = 1,
                            animation_speed = electric_drill_animation_speed,
                            draw_as_shadow = true,
                            shift = util.by_pixel(19, -3),
                            repeat_count = 5,
                            scale = 0.5,
                        },
                    },
                },
                east = {
                    layers = {
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-E.png',
                            line_length = 1,
                            width = 194,
                            height = 94,
                            frame_count = 1,
                            animation_speed = electric_drill_animation_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -33),
                            repeat_count = 5,
                            scale = 0.5,
                        },
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-E-output.png',
                            line_length = 5,
                            width = 50,
                            height = 56,
                            frame_count = 5,
                            animation_speed = electric_drill_animation_speed,
                            direction_count = 1,
                            shift = util.by_pixel(30, -11),
                            scale = 0.5,
                        },
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-E-shadow.png',
                            line_length = 1,
                            width = 276,
                            height = 170,
                            frame_count = 1,
                            animation_speed = electric_drill_animation_speed,
                            draw_as_shadow = true,
                            shift = util.by_pixel(20, 6),
                            repeat_count = 5,
                            scale = 0.5,
                        },
                    },
                },
                south = {
                    layers = {
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-S.png',
                            line_length = 1,
                            width = 194,
                            height = 240,
                            frame_count = 1,
                            animation_speed = electric_drill_animation_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -7),
                            repeat_count = 5,
                            scale = 0.5,
                        },
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-S-shadow.png',
                            line_length = 1,
                            width = 274,
                            height = 204,
                            frame_count = 1,
                            animation_speed = electric_drill_animation_speed,
                            draw_as_shadow = true,
                            shift = util.by_pixel(19, 2),
                            repeat_count = 5,
                            scale = 0.5,
                        },
                    },
                },
                west = {
                    layers = {
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-W.png',
                            line_length = 1,
                            width = 194,
                            height = 94,
                            frame_count = 1,
                            animation_speed = electric_drill_animation_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -33),
                            repeat_count = 5,
                            scale = 0.5,
                        },
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-W-output.png',
                            line_length = 5,
                            width = 50,
                            height = 56,
                            frame_count = 5,
                            animation_speed = electric_drill_animation_speed,
                            direction_count = 1,
                            shift = util.by_pixel(-31, -12),
                            scale = 0.5,
                        },
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-W-shadow.png',
                            line_length = 1,
                            width = 282,
                            height = 170,
                            frame_count = 1,
                            animation_speed = electric_drill_animation_speed,
                            draw_as_shadow = true,
                            shift = util.by_pixel(15, 6),
                            repeat_count = 5,
                            scale = 0.5,
                        },
                    },
                },
            },

            shift_animation_waypoints = {
        -- Movement should be between 0.3-0.5 distance
        -- Bounds -0.7 - 0.6
        -- stylua: ignore start
        north = {{0, 0}, {0, 0.4}, {0, 0.1}, {0, -0.25}, {0, -0.5}, {0, -0.2}, {0, 0}, {0, -0.4}, {0, -0.1}, {0, 0.2}, {0, 0.6}, {0, 0.3}, {0, -0.1}, {0, -0.4}, {0, 0}, {0, 0.3}},
        -- Bounds -0.6 - 0.4
        east = {{0, 0}, {0.4, 0}, {0.1, 0}, {-0.3, 0}, {-0.6, 0}, {-0.2, 0}, {0.1, 0}, {-0.3, 0}, {0, 0}, {-0.35, 0}, {-0.6, 0}, {-0.2, 0}, {0.1, 0}, {-0.3, 0}},
        -- Bounds -0.7 - 0.5
        south = {{0, 0}, {0, -0.4}, {0, -0.1}, {0, 0.2}, {0, 0.5}, {0, 0.3}, {0, 0}, {0, 0.4}, {0, 0.1}, {0, -0.2}, {0, -0.6}, {0, -0.3}, {0, 0.1}, {0, 0.4}, {0, 0}, {0, -0.3}},
        -- Bounds -0.4 - 0.6
        west = {{0, 0}, {-0.4, 0}, {-0.1, 0}, {0.3, 0}, {0.6, 0}, {0.2, 0}, {-0.1, 0}, {0.3, 0}, {0, 0}, {0.35, 0}, {0.6, 0}, {0.2, 0}, {-0.1, 0}, {0.3, 0}},
                -- stylua: ignore end
            },

            shift_animation_waypoint_stop_duration = 195 / electric_drill_animation_speed,
            shift_animation_transition_duration = 30 / electric_drill_animation_speed,

            working_visualisations = {
                -- dust animation 1
                {
                    constant_speed = true,
                    synced_fadeout = true,
                    align_to_waypoint = true,
                    apply_tint = 'resource-color',
                    animation = graphics.smoke(),
                    north_position = { 0, 0.25 },
                    east_position = { 0, 0 },
                    south_position = { 0, 0.25 },
                    west_position = { 0, 0 },
                },

                -- dust animation directional 1
                {
                    constant_speed = true,
                    fadeout = true,
                    apply_tint = 'resource-color',
                    north_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-N-smoke.png',
                                line_length = 5,
                                width = 46,
                                height = 58,
                                frame_count = 10,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(1, -44),
                                scale = 0.5,
                            },
                        },
                    },
                    east_animation = nil,
                    south_animation = nil,
                    west_animation = nil,
                },

                -- drill back animation
                {
                    animated_shift = true,
                    always_draw = true,
                    north_animation = {
                        layers = {
                            graphics.mk2_animation(),
                            graphics.shadow_animation(),
                        },
                    },
                    east_animation = {
                        layers = {
                            graphics.mk2_horizontal_animation(),
                            graphics.horizontal_shadow_animation(),
                        },
                    },
                    south_animation = {
                        layers = {
                            graphics.mk2_animation(),
                            graphics.shadow_animation(),
                        },
                    },
                    west_animation = {
                        layers = {
                            graphics.mk2_horizontal_animation(),
                            graphics.horizontal_shadow_animation(),
                        },
                    },
                },

                -- dust animation 2
                {
                    constant_speed = true,
                    synced_fadeout = true,
                    align_to_waypoint = true,
                    apply_tint = 'resource-color',
                    animation = electric_mining_drill_smoke_front(),
                    north_position = { 0, 0.25 },
                    east_position = { 0, 0 },
                    south_position = { 0, 0.25 },
                    west_position = { 0, 0 },
                },

                -- dust animation directional 2
                {
                    constant_speed = true,
                    fadeout = true,
                    apply_tint = 'resource-color',
                    north_animation = nil,
                    east_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-E-smoke.png',
                                line_length = 5,
                                width = 52,
                                height = 56,
                                frame_count = 10,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(25, -12),
                                scale = 0.5,
                            },
                        },
                    },
                    south_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-S-smoke.png',
                                line_length = 5,
                                width = 48,
                                height = 36,
                                frame_count = 10,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(-2, 20),
                                scale = 0.5,
                            },
                        },
                    },
                    west_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-W-smoke.png',
                                line_length = 5,
                                width = 46,
                                height = 54,
                                frame_count = 10,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(-25, -11),
                                scale = 0.5,
                            },
                        },
                    },
                },

                -- front frame
                {
                    always_draw = true,
                    north_animation = nil,
                    east_animation = {
                        priority = 'high',
                        filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-E-front.png',
                        line_length = 1,
                        width = 208,
                        height = 186,
                        frame_count = 1,
                        animation_speed = electric_drill_animation_speed,
                        direction_count = 1,
                        shift = util.by_pixel(3, 2),
                        scale = 0.5,
                    },
                    south_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-S-output.png',
                                line_length = 5,
                                width = 82,
                                height = 56,
                                frame_count = 5,
                                animation_speed = electric_drill_animation_speed,
                                shift = util.by_pixel(-1, 34),
                                scale = 0.5,
                            },
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-S-front.png',
                                line_length = 1,
                                width = 172,
                                height = 42,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                repeat_count = 5,
                                shift = util.by_pixel(0, 13),
                                scale = 0.5,
                            },
                        },
                    },
                    west_animation = {
                        priority = 'high',
                        filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-W-front.png',
                        line_length = 1,
                        width = 210,
                        height = 190,
                        frame_count = 1,
                        animation_speed = electric_drill_animation_speed,
                        direction_count = 1,
                        shift = util.by_pixel(-4, 1),
                        scale = 0.5,
                    },
                },

                -- drill front animation
                {
                    animated_shift = true,
                    always_draw = true,
                    --north_animation = util.empty_sprite(),
                    east_animation = graphics.horizontal_front_animation(),
                    --south_animation = util.empty_sprite(),
                    west_animation = graphics.horizontal_front_animation(),
                },

                -- LEDs
                graphics.status_leds_working_visualisation(),

                -- light
                {
                    -- always_draw = true,
                    light = { intensity = 1, size = 2, color = { r = 1, g = 1, b = 1 } },
                    north_position = { 1, -2.0 },
                    east_position = { 1.5, -1.5 },
                    south_position = { 1, 0.5 },
                    west_position = { -1.5, -1.5 },
                },
            },
        },

        wet_mining_graphics_set = {
            drilling_vertical_movement_duration = 10 / electric_drill_animation_speed,
            animation_progress = 1,
            min_animation_progress = 0,
            max_animation_progress = 30,

            status_colors = electric_mining_drill_status_colors(),

            circuit_connector_layer = 'object',
            circuit_connector_secondary_draw_order = { north = 14, east = 44, south = 44, west = 44 },

            animation = {
                north = {
                    layers = {
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-N-wet.png',
                            line_length = 1,
                            width = 194,
                            height = 242,
                            frame_count = 1,
                            animation_speed = electric_drill_animation_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -12),
                            repeat_count = 5,
                            scale = 0.5,
                        },
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-N-output.png',
                            line_length = 5,
                            width = 72,
                            height = 66,
                            frame_count = 5,
                            animation_speed = electric_drill_animation_speed,
                            direction_count = 1,
                            shift = util.by_pixel(-1, -44),
                            scale = 0.5,
                        },
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-N-wet-shadow.png',
                            line_length = 1,
                            width = 276,
                            height = 222,
                            frame_count = 1,
                            animation_speed = electric_drill_animation_speed,
                            draw_as_shadow = true,
                            shift = util.by_pixel(19, 1),
                            repeat_count = 5,
                            scale = 0.5,
                        },
                    },
                },
                west = {
                    layers = {
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-W-wet.png',
                            line_length = 1,
                            width = 194,
                            height = 94,
                            frame_count = 1,
                            animation_speed = electric_drill_animation_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -33),
                            repeat_count = 5,
                            scale = 0.5,
                        },
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-W-output.png',
                            line_length = 5,
                            width = 50,
                            height = 56,
                            frame_count = 5,
                            animation_speed = electric_drill_animation_speed,
                            direction_count = 1,
                            shift = util.by_pixel(-31, -12),
                            scale = 0.5,
                        },
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-W-wet-shadow.png',
                            line_length = 1,
                            width = 284,
                            height = 194,
                            frame_count = 1,
                            animation_speed = electric_drill_animation_speed,
                            draw_as_shadow = true,
                            shift = util.by_pixel(15, 8),
                            repeat_count = 5,
                            scale = 0.5,
                        },
                    },
                },
                south = {
                    layers = {
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-S-wet.png',
                            line_length = 1,
                            width = 194,
                            height = 240,
                            frame_count = 1,
                            animation_speed = electric_drill_animation_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -7),
                            repeat_count = 5,
                            scale = 0.5,
                        },
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-S-wet-shadow.png',
                            line_length = 1,
                            width = 276,
                            height = 204,
                            frame_count = 1,
                            animation_speed = electric_drill_animation_speed,
                            draw_as_shadow = true,
                            shift = util.by_pixel(19, 2),
                            repeat_count = 5,
                            scale = 0.5,
                        },
                    },
                },
                east = {
                    layers = {
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-E-wet.png',
                            line_length = 1,
                            width = 194,
                            height = 94,
                            frame_count = 1,
                            animation_speed = electric_drill_animation_speed,
                            direction_count = 1,
                            shift = util.by_pixel(0, -33),
                            repeat_count = 5,
                            scale = 0.5,
                        },
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-E-output.png',
                            line_length = 5,
                            width = 50,
                            height = 56,
                            frame_count = 5,
                            animation_speed = electric_drill_animation_speed,
                            direction_count = 1,
                            shift = util.by_pixel(30, -11),
                            scale = 0.5,
                        },
                        {
                            priority = 'high',
                            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-E-wet-shadow.png',
                            line_length = 1,
                            width = 276,
                            height = 194,
                            frame_count = 1,
                            animation_speed = electric_drill_animation_speed,
                            draw_as_shadow = true,
                            shift = util.by_pixel(20, 8),
                            repeat_count = 5,
                            scale = 0.5,
                        },
                    },
                },
            },

            shift_animation_waypoints = graphics.shift_animation_waypoints(),

            shift_animation_waypoint_stop_duration = 195 / electric_drill_animation_speed,
            shift_animation_transition_duration = 30 / electric_drill_animation_speed,

            working_visualisations = {
                -- dust animation 1
                {
                    constant_speed = true,
                    synced_fadeout = true,
                    align_to_waypoint = true,
                    apply_tint = 'resource-color',
                    animation = graphics.smoke(),
                    north_position = { 0, 0.25 },
                    east_position = { 0, 0 },
                    south_position = { 0, 0.25 },
                    west_position = { 0, 0 },
                },

                -- dust animation directional 1
                {
                    constant_speed = true,
                    fadeout = true,
                    apply_tint = 'resource-color',
                    north_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-N-smoke.png',
                                line_length = 5,
                                width = 46,
                                height = 58,
                                frame_count = 10,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(1, -44),
                                scale = 0.5,
                            },
                        },
                    },
                    east_animation = nil,
                    south_animation = nil,
                    west_animation = nil,
                },

                -- drill back animation
                {
                    animated_shift = true,
                    always_draw = true,
                    north_animation = {
                        layers = {
                            graphics.mk2_animation(),
                            graphics.shadow_animation(),
                        },
                    },
                    east_animation = {
                        layers = {
                            graphics.mk2_horizontal_animation(),
                            graphics.horizontal_shadow_animation(),
                        },
                    },
                    south_animation = {
                        layers = {
                            graphics.mk2_animation(),
                            graphics.shadow_animation(),
                        },
                    },
                    west_animation = {
                        layers = {
                            graphics.mk2_horizontal_animation(),
                            graphics.horizontal_shadow_animation(),
                        },
                    },
                },

                -- dust animation 2
                {
                    constant_speed = true,
                    synced_fadeout = true,
                    align_to_waypoint = true,
                    apply_tint = 'resource-color',
                    animation = graphics.smoke_front(),
                },

                -- dust animation directional 2
                {
                    constant_speed = true,
                    fadeout = true,
                    apply_tint = 'resource-color',
                    north_animation = nil,
                    east_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-E-smoke.png',
                                line_length = 5,
                                width = 52,
                                height = 56,
                                frame_count = 10,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(25, -12),
                                scale = 0.5,
                            },
                        },
                    },
                    south_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-S-smoke.png',
                                line_length = 5,
                                width = 48,
                                height = 36,
                                frame_count = 10,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(-2, 20),
                                scale = 0.5,
                            },
                        },
                    },
                    west_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-W-smoke.png',
                                line_length = 5,
                                width = 46,
                                height = 54,
                                frame_count = 10,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(-25, -11),
                                scale = 0.5,
                            },
                        },
                    },
                },

                -- fluid window background (bottom)
                {
                    -- render_layer = 'lower-object-above-shadow',
                    secondary_draw_order = -49,
                    always_draw = true,
                    north_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-N-wet-window-background-front.png',
                                line_length = 1,
                                width = 132,
                                height = 28,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(-1, -18),
                                scale = 0.5,
                            },
                        },
                    },
                    east_animation = nil,
                    south_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-S-wet-window-background.png',
                                line_length = 1,
                                width = 132,
                                height = 88,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(-1, -33),
                                scale = 0.5,
                            },
                        },
                    },
                    west_animation = nil,
                },

                -- fluid window background (front)
                {
                    always_draw = true,
                    north_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-N-wet-window-background.png',
                                line_length = 1,
                                width = 30,
                                height = 20,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(1, 21),
                                scale = 0.5,
                            },
                        },
                    },
                    west_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-W-wet-window-background-front.png',
                                line_length = 1,
                                width = 88,
                                height = 86,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(11, 0),
                                scale = 0.5,
                            },
                        },
                    },
                    south_animation = nil,
                    east_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-E-wet-window-background-front.png',
                                line_length = 1,
                                width = 86,
                                height = 86,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(-12, 0),
                                scale = 0.5,
                            },
                        },
                    },
                },
                -- fluid base (bottom)
                {
                    always_draw = true,
                    -- render_layer = 'lower-object-above-shadow',
                    secondary_draw_order = -48,
                    apply_tint = 'input-fluid-base-color',
                    north_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-N-wet-fluid-background-front.png',
                                line_length = 1,
                                width = 130,
                                height = 36,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(0, -17),
                                scale = 0.5,
                            },
                        },
                    },
                    east_animation = nil,
                    south_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-S-wet-fluid-background.png',
                                line_length = 1,
                                width = 130,
                                height = 96,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(0, -32),
                                scale = 0.5,
                            },
                        },
                    },
                    west_animation = nil,
                },

                -- fluid base (front)
                {
                    always_draw = true,
                    apply_tint = 'input-fluid-base-color',
                    north_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-N-wet-fluid-background.png',
                                line_length = 1,
                                width = 28,
                                height = 22,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(2, 21),
                                scale = 0.5,
                            },
                        },
                    },
                    west_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-W-wet-fluid-background-front.png',
                                line_length = 1,
                                width = 82,
                                height = 88,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(12, -1),
                                scale = 0.5,
                            },
                        },
                    },
                    south_animation = nil,
                    east_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-E-wet-fluid-background-front.png',
                                line_length = 1,
                                width = 82,
                                height = 88,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(-12, -1),
                                scale = 0.5,
                            },
                        },
                    },
                },

                -- fluid flow (bottom)
                {
                    --render_layer = 'lower-object-above-shadow',
                    secondary_draw_order = -47,
                    always_draw = true,
                    apply_tint = 'input-fluid-flow-color',
                    north_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-N-wet-fluid-flow-front.png',
                                line_length = 1,
                                width = 130,
                                height = 28,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(-2, -17),
                                scale = 0.5,
                            },
                        },
                    },
                    east_animation = nil,
                    south_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-S-wet-fluid-flow.png',
                                line_length = 1,
                                width = 130,
                                height = 88,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(-2, -32),
                                scale = 0.5,
                            },
                        },
                    },
                    west_animation = nil,
                },

                -- fluid flow (front)
                {
                    always_draw = true,
                    apply_tint = 'input-fluid-flow-color',
                    north_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-N-wet-fluid-flow.png',
                                line_length = 1,
                                width = 26,
                                height = 20,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(2, 22),
                                scale = 0.5,
                            },
                        },
                    },
                    west_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-W-wet-fluid-flow-front.png',
                                line_length = 1,
                                width = 84,
                                height = 86,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(11, 0),
                                scale = 0.5,
                            },
                        },
                    },
                    south_animation = nil,
                    east_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-E-wet-fluid-flow-front.png',
                                line_length = 1,
                                width = 82,
                                height = 86,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(-12, 0),
                                scale = 0.5,
                            },
                        },
                    },
                },

                -- front frame (wet)
                {
                    always_draw = true,
                    north_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-N-wet-front.png',
                                line_length = 1,
                                width = 162,
                                height = 124,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(-2, 20),
                                scale = 0.5,
                            },
                        },
                    },
                    west_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-W-wet-front.png',
                                line_length = 1,
                                width = 210,
                                height = 190,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(-4, 1),
                                scale = 0.5,
                            },
                        },
                    },
                    south_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-S-output.png',
                                line_length = 5,
                                width = 82,
                                height = 56,
                                frame_count = 5,
                                animation_speed = electric_drill_animation_speed,
                                shift = util.by_pixel(-1, 34),
                                scale = 0.5,
                            },
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-S-wet-front.png',
                                line_length = 1,
                                width = 192,
                                height = 70,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                repeat_count = 5,
                                shift = util.by_pixel(0, 19),
                                scale = 0.5,
                            },
                        },
                    },
                    east_animation = {
                        layers = {
                            {
                                priority = 'high',
                                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-E-wet-front.png',
                                line_length = 1,
                                width = 208,
                                height = 186,
                                frame_count = 1,
                                animation_speed = electric_drill_animation_speed,
                                direction_count = 1,
                                shift = util.by_pixel(3, 2),
                                scale = 0.5,
                            },
                        },
                    },
                },

                -- drill front animation
                {
                    animated_shift = true,
                    always_draw = true,
                    east_animation = graphics.horizontal_front_animation(),
                    west_animation = graphics.horizontal_front_animation(),
                },

                -- LEDs
                graphics.status_leds_working_visualisation(),

                -- light
                {
                    light = { intensity = 1, size = 2, color = { r = 1, g = 1, b = 1 } },
                    north_position = { 1, -2.0 },
                    east_position = { 1.5, -1.5 },
                    south_position = { 1, 0.5 },
                    west_position = { -1.5, -1.5 },
                },
            },
        },
        integration_patch = {
            north = {
                priority = 'high',
                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-N-integration.png',
                line_length = 1,
                width = 230,
                height = 236,
                frame_count = 1,
                animation_speed = electric_drill_animation_speed,
                direction_count = 1,
                shift = util.by_pixel(0, -2),
                repeat_count = 5,
                scale = 0.5,
            },
            east = {
                priority = 'high',
                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-E-integration.png',
                line_length = 1,
                width = 238,
                height = 204,
                frame_count = 1,
                animation_speed = electric_drill_animation_speed,
                direction_count = 1,
                shift = util.by_pixel(2, 5),
                repeat_count = 5,
                scale = 0.5,
            },
            south = {
                priority = 'high',
                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-S-integration.png',
                line_length = 1,
                width = 224,
                height = 228,
                frame_count = 1,
                animation_speed = electric_drill_animation_speed,
                direction_count = 1,
                shift = util.by_pixel(0, -2),
                repeat_count = 5,
                scale = 0.5,
            },
            west = {
                priority = 'high',
                filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-W-integration.png',
                line_length = 1,
                width = 234,
                height = 202,
                frame_count = 1,
                animation_speed = electric_drill_animation_speed,
                direction_count = 1,
                shift = util.by_pixel(-3, 5),
                repeat_count = 5,
                scale = 0.5,
            },
        },
        radius_visualisation_picture = {
            filename = '__redmew-data__/graphics/entity/fluid-electric-mining-drill/electric-mining-drill-radius-visualization.png',
            width = 10,
            height = 10,
        },
        monitor_visualization_tint = { r = 78, g = 173, b = 255 },
        circuit_connector = circuit_connector_definitions['electric-mining-drill'],
        circuit_wire_max_distance = default_circuit_wire_max_distance,
    },
})

redmew.add_unlock('electric-mining-drill', 'fluid-electric-mining-drill')

local mining_drill = data.raw['mining-drill']['electric-mining-drill']
if mining_drill then
	mining_drill.input_fluid_box = nil
	mining_drill.wet_mining_graphics_set = nil
	mining_drill.fast_replaceable_group = 'electric-mining-drill'
end
