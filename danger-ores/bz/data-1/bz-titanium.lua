if not mods['bztitanium'] then return end

data:extend({
  {
    type = 'item',
    name = 'titanium-processed',
    icon = '__redmew-data__/graphics/icons/rare-1.png',
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = 'raw-material',
    order = 'b[titanium-processed]',
    stack_size = 50
  },
  {
    type = 'recipe',
    name = 'titanium-processed',
    always_show_made_in = true,
    energy_required = 12,
    enabled = false,
    category = 'crafting-with-fluid',
    ingredients =
    {
      { type = 'item', name = 'titanium-ore', amount = 15 },
      { type = 'fluid', name = 'lubricant', amount = 45 }
    },
    icon = '__redmew-data__/graphics/icons/rare-1.png',
    icon_size = 64, icon_mipmaps = 4,
    subgroup = 'raw-material',
    order = 'b[titanium-processed]',
    result = 'titanium-processed',
    result_count = 15,
    crafting_machine_tint =
    {
      primary = {r = 0.41, g = 0.41, b = 0.41, a = 1.000}, -- #696969
      secondary = {r = 1.000, g = 0.722, b = 0.376, a = 1.000}, -- #ffb85fff
      tertiary = {r = 0.854, g = 0.659, b = 0.576, a = 1.000}, -- #d9a892ff
      quaternary = {r = 1.000, g = 0.494, b = 0.271, a = 1.000}, -- #ff7e45ff
    }
  },
})

redmew.whitelist_productivity('titanium-processed')
redmew.add_unlock('titanium-processing', 'titanium-processed')

for _, recipe in pairs(data.raw.recipe) do
  if recipe.name ~= 'titanium-processed' then
    if redmew.has_ingredient(recipe.name, 'titanium-ore') then
      redmew.replace_ingredient(recipe.name, 'titanium-ore', 'titanium-processed')
    end
  end
end
