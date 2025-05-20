for _, wall in pairs(data.raw.wall) do
    wall.pictures.water_connection_patch = nil
end

local wall = data.raw.wall['stone-wall']
if wall then
    local path = '__redmew-data__/graphics/entity/stone-wall/'
    local function reskin(property, filename)
        if wall.pictures[property].layers then
            wall.pictures[property].layers[1].filename = path .. filename
        end
        if wall.pictures[property].sheets then
            wall.pictures[property].sheets[1].filename = path .. filename
        end
    end

    reskin('single', 'wall-single.png')
    reskin('straight_vertical', 'wall-vertical.png')
    reskin('straight_horizontal', 'wall-horizontal.png')
    reskin('corner_right_down', 'wall-corner-right.png')
    reskin('corner_left_down', 'wall-corner-left.png')
    reskin('t_up', 'wall-t.png')
    reskin('ending_right', 'wall-ending-right.png')
    reskin('ending_left', 'wall-ending-left.png')
    reskin('gate_connection_patch', 'wall-gate.png')
    reskin('filling', 'wall-filling.png')

    data.raw.item['stone-wall'].icon = '__redmew-data__/graphics/icons/stone-wall.png'
    --data.raw.item['gate'].icon = '__redmew-data__/graphics/icons/gate.png'
end