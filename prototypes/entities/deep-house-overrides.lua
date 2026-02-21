local container = data.raw.container['deep-house']
if not container then
    return
end

local stack_size_override = container.inventory_properties.stack_size_override or {}

--- Blacklist ores
for _, resource in pairs(data.raw.resource) do
    local minable = resource.minable
    if not minable then goto continue end
    if resource.hidden then goto continue end
    
    local result = minable.result
    if result then
        stack_size_override[result] = 1
    end

    for _, result in pairs(minable.results or {}) do
        if result.type == 'item' then
            stack_size_override[result.name] = 1
        end
    end

    ::continue::
end

--- Blacklist direct products of ores
local new_overrides = {}
for _, recipe in pairs(data.raw.recipe) do
    if recipe.ingredients and #recipe.ingredients == 1 then
        local i = recipe.ingredients[1]
        if i.type == 'item' and stack_size_override[i.name] then
            for _, r in pairs(recipe.results) do
                if r.type == 'item' then
                    new_overrides[r.name] = 1
                end
            end
        end
    end
end

for name, amount in pairs(new_overrides) do
    stack_size_override[name] = amount
end

container.inventory_properties.stack_size_override = stack_size_override
