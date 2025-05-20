if not redmew.loader.enabled('dy:vanilla') then return end

redmew.add_library({
    events = {
        [defines.events.on_tick] = function()
            local daytime = (game.tick % 25000) / 25000
            local coefficient = 1.0

            if daytime < 0.2 then
                coefficient =  1 - (daytime / 0.2)
            elseif daytime < 0.3 then
                coefficient = 0
            elseif daytime < 0.5 then
                coefficient = (daytime - 0.3) / 0.2
            end

            for _, surface in pairs(game.surfaces) do
                surface.set_property('thermal', 100 * coefficient)
            end
        end
    }
})