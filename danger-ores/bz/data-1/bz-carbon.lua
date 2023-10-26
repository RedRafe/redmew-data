if not mods['bzcarbon'] then return end

data:extend({
  {
    type = 'item',
    name = 'graphite-powder',
    icon = '__redmew-data__/graphics/icons/uranium-powder-1-light.png',
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = 'raw-material',
    order = 'g[graphite-powder]',
    stack_size = 50
  },
  {
    type = 'recipe',
    name = 'graphite-powder',
    always_show_made_in = true,
    energy_required = 4,
    enabled = false,
    category = 'chemistry',
    ingredients =
    {
      { type = 'item', name = 'flake-graphite', amount = 15 },
      { type = 'fluid', name = 'steam', amount = 15 }
    },
    icon = '__redmew-data__/graphics/icons/uranium-powder-1-light.png',
    icon_size = 64, icon_mipmaps = 4,
    subgroup = 'raw-material',
    order = 'k[graphite-powder-1]',
    result = 'graphite-powder',
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

redmew.whitelist_productivity('graphite-powder')
redmew.add_unlock('graphite-processing', 'graphite-powder')
redmew.add_prerequisite('graphite-processing', 'basic-chemistry')

for _, recipe in pairs(data.raw.recipe) do
  if recipe.name ~= 'graphite-powder' then
    if redmew.has_ingredient(recipe.name, 'flake-graphite') then
      redmew.replace_ingredient(recipe.name, 'flake-graphite', 'graphite-powder')
    end
  end
end
