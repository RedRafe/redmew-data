if data.raw['transport-belt']['turbo-transport-belt'] then
    local turbo_speed = 0.1875
    data.raw['transport-belt']['turbo-transport-belt'].speed = turbo_speed
    data.raw['underground-belt']['turbo-underground-belt'].speed = turbo_speed
    data.raw['splitter']['turbo-splitter'].speed = turbo_speed
    data.raw['loader']['turbo-loader'].speed = turbo_speed

    if data.raw['loader-1x1']['aai-turbo-loader'] then
        data.raw['loader-1x1']['aai-turbo-loader'].speed = turbo_speed
    end
    if data.raw['loader-1x1']['turbo-transport-belt-loader'] then
        data.raw['loader-1x1']['turbo-transport-belt-loader'].speed = turbo_speed
    end
    if data.raw['furnace']['turbo-transport-belt-beltbox'] then
        data.raw['furnace']['turbo-transport-belt-beltbox'].crafting_speed = 4
    end
end
