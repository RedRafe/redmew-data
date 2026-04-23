redmew.interrupt_infinite_tech('research-productivity', 11)
redmew.interrupt_infinite_tech('research-productivity', 21)
redmew.interrupt_infinite_tech('research-productivity', 31)

for _, tech_name in pairs({
    'steel-plate-productivity',
    'low-density-structure-productivity',
    'plastic-bar-productivity',
    'rocket-fuel-productivity',
    'processing-unit-productivity',
}) do
    redmew.interrupt_infinite_tech(tech_name, 11)
    redmew.interrupt_infinite_tech(tech_name, 21)
    redmew.add_prerequisite('cave-drill', tech_name)
    redmew.add_prerequisite(tech_name, 'research-productivity')
    redmew.add_prerequisite(tech_name..'-11', 'research-productivity-11')
    redmew.add_prerequisite(tech_name..'-21', 'research-productivity-21')
    redmew.add_prerequisite('belt-stacking-1', tech_name..'-21')
    redmew.add_prerequisite('fusion-lab', tech_name..'-21')
end

redmew.interrupt_infinite_tech('mining-productivity', 11)
redmew.interrupt_infinite_tech('mining-productivity', 21)
redmew.add_prerequisite('cave-drill', 'mining-productivity-4')

local function ingredients()
    return {
        { 'automation-science-pack', 1 },
        { 'logistic-science-pack', 1 },
        { 'military-science-pack', 1 },
        { 'chemical-science-pack', 1 },
        { 'production-science-pack', 1 },
        { 'utility-science-pack', 1 },
        { 'space-science-pack', 1 },
    }
end

for i, count in pairs({ 20e6, 100e6, 1e9 }) do
    local tech = data.raw.technology['belt-stacking-'..i]
    if tech then
        tech.unit.ingredients = ingredients()
        tech.unit.count = count
    end
end

redmew.add_prerequisite('belt-stacking-2', 'belt-stacking-1')
redmew.add_prerequisite('belt-stacking-3', 'belt-stacking-2')

data.raw.technology['fusion-lab'].unit.count = 100e6