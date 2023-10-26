if not mods['bzgold'] then return end

data:extend({
  {
    type = 'autoplace-control',
    category = 'resource',
    name = 'rich-copper-ore',
    richness = true,
    order = 'zzzzzzzzzzz'
  },
  {
    type = 'item',
    name = 'rich-metal',
    icon = '__redmew-data__/graphics/icons/rare-3.png',
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = 'raw-material',
    order = 'a[rich-metal]',
    stack_size = 50
  },
  {
    type = 'recipe',
    name = 'rich-metal',
    always_show_made_in = true,
    energy_required = 4,
    enabled = false,
    category = 'crafting-with-fluid',
    ingredients =
    {
      { type = 'item', name = 'rich-copper-ore', amount = 15 },
      { type = 'fluid', name = 'water', amount = 15 }
    },
    icon = '__redmew-data__/graphics/icons/rare-3.png',
    icon_size = 64, icon_mipmaps = 4,
    subgroup = 'raw-material',
    order = 'a[rich-metal]',
    result = 'rich-metal',
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

redmew.whitelist_productivity('rich-metal')
redmew.add_unlock('palladium-processing', 'rich-metal')
redmew.add_unlock('platinum-processing', 'rich-metal')

for _, recipe in pairs(data.raw.recipe) do
  if recipe.name ~= 'rich-metal' then
    if redmew.has_ingredient(recipe.name, 'rich-copper-ore') then
      redmew.replace_ingredient(recipe.name, 'rich-copper-ore', 'rich-metal')
    end
  end
end
