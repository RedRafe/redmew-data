if data.raw['transport-belt']['express-transport-belt'] then
    local express_speed = 0.125
    data.raw['transport-belt']['express-transport-belt'].speed = express_speed
    data.raw['underground-belt']['express-underground-belt'].speed = express_speed
    data.raw['splitter']['express-splitter'].speed = express_speed
    data.raw['loader']['express-loader'].speed = express_speed

    if data.raw['loader-1x1']['redmew-express-loader'] then
        data.raw['loader-1x1']['redmew-express-loader'].speed = express_speed
    end
    if data.raw['loader-1x1']['aai-express-loader'] then
        data.raw['loader-1x1']['aai-express-loader'].speed = express_speed
    end
    if data.raw['loader-1x1']['express-transport-belt-loader'] then
        data.raw['loader-1x1']['express-transport-belt-loader'].speed = express_speed
    end
    if data.raw['furnace']['express-transport-belt-beltbox'] then
        data.raw['furnace']['express-transport-belt-beltbox'].crafting_speed = 4
    end
end
