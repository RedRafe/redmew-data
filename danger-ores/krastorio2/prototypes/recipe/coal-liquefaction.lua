local CL = data.raw.recipe["coal-liquefaction"]
CL.ingredients = 
{
    { type = "item", name = "coal", amount = 10 },
    { type = "fluid", name = "steam", amount = 50 }
}
CL.results =
{
    { type = "fluid", name = "heavy-oil", amount = 65 },
    { type = "fluid", name = "light-oil", amount = 20 },
    { type = "fluid", name = "petroleum-gas", amount = 10 }
}