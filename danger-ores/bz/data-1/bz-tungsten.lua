if not mods['bztungsten'] then return end

data:extend({
  {
    type = 'item',
    name = 'tungsten-processed',
    icon = '__redmew-data__/graphics/icons/rare-2.png',
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = 'raw-material',
    order = 'b[tungsten-processed]',
    stack_size = 50
  },
  {
    type = 'recipe',
    name = 'tungsten-processed',
    always_show_made_in = true,
    energy_required = 8,
    enabled = false,
    category = 'crafting-with-fluid',
    ingredients =
    {
      { type = 'item', name = 'tungsten-ore', amount = 15 },
      { type = 'fluid', name = 'water', amount = 150 }
    },
    icon = '__redmew-data__/graphics/icons/rare-2.png',
    icon_size = 64, icon_mipmaps = 4,
    subgroup = 'raw-material',
    order = 'b[tungsten-processed]',
    result = 'tungsten-processed',
    result_count = 15,
    crafting_machine_tint =
    {
      primary = {r = 1, g = 0, b = 0, a = 1.000},
      secondary = {r = 1.000, g = 0.722, b = 0.376, a = 1.000}, -- #ffb85fff
      tertiary = {r = 0.854, g = 0.659, b = 0.576, a = 1.000}, -- #d9a892ff
      quaternary = {r = 1.000, g = 0.494, b = 0.271, a = 1.000}, -- #ff7e45ff
    }
  },
})

redmew.whitelist_productivity('tungsten-processed')
redmew.add_unlock('tungsten-processing', 'tungsten-processed')

for _, recipe in pairs(data.raw.recipe) do
  if recipe.name ~= 'tungsten-processed' then
    if redmew.has_ingredient(recipe.name, 'tungsten-ore') then
      redmew.replace_ingredient(recipe.name, 'tungsten-ore', 'tungsten-processed')
    end
  end
end
