-- Credits to "Everything on Nauvis" mod by Spaghetti2364
---------------------------------------------------------

--- Remove planets
data.raw.planet['aquilo'].map_gen_settings = nil
if data.raw.planet['aquilo'] then
    data.raw.planet['aquilo'].hidden = true
end

data.raw.planet['fulgora'].map_gen_settings = nil
if data.raw.planet['fulgora'] then
    data.raw.planet['fulgora'].hidden = true
end

data.raw.planet['gleba'].map_gen_settings = nil
if data.raw.planet['gleba'] then
    data.raw.planet['gleba'].hidden = true
end

data.raw.planet['vulcanus'].map_gen_settings = nil
if data.raw.planet['vulcanus'] then
    data.raw.planet['vulcanus'].hidden = true
end

--- Remove space connections
redmew.remove_prototype('space-connection', 'nauvis-vulcanus')
redmew.remove_prototype('space-connection', 'nauvis-gleba')
redmew.remove_prototype('space-connection', 'nauvis-fulgora')
redmew.remove_prototype('space-connection', 'vulcanus-gleba')
redmew.remove_prototype('space-connection', 'gleba-fulgora')
redmew.remove_prototype('space-connection', 'gleba-aquilo')
redmew.remove_prototype('space-connection', 'fulgora-aquilo')
data.raw['space-connection']['aquilo-solar-system-edge'].from = 'nauvis'
--redmew.remove_prototype("space-connection", "aquilo-solar-system-edge")

data.raw['utility-constants']['default'].main_menu_simulations.nauvis_oil_refinery = nil
data.raw['utility-constants']['default'].main_menu_simulations.nauvis_early_smelting = nil -- This one crashes after it finishes
data.raw['utility-constants']['default'].main_menu_simulations.nauvis_train_station = nil
data.raw['utility-constants']['default'].main_menu_simulations.nauvis_train_junction = nil
data.raw['utility-constants']['default'].main_menu_simulations.nauvis_artillery = nil
data.raw['utility-constants']['default'].main_menu_simulations.platform_moving = nil
data.raw['utility-constants']['default'].main_menu_simulations.platform_messy_nuclear = nil
data.raw['utility-constants']['default'].main_menu_simulations.vulcanus_lava_forge = nil
data.raw['utility-constants']['default'].main_menu_simulations.vulcanus_crossing = nil
data.raw['utility-constants']['default'].main_menu_simulations.vulcanus_punishmnent = nil
data.raw['utility-constants']['default'].main_menu_simulations.vulcanus_sulfur_drop = nil
data.raw['utility-constants']['default'].main_menu_simulations.gleba_agri_towers = nil
data.raw['utility-constants']['default'].main_menu_simulations.gleba_pentapod_ponds = nil
data.raw['utility-constants']['default'].main_menu_simulations.gleba_egg_escape = nil
data.raw['utility-constants']['default'].main_menu_simulations.gleba_farm_attack = nil
data.raw['utility-constants']['default'].main_menu_simulations.gleba_grotto = nil
data.raw['utility-constants']['default'].main_menu_simulations.fulgora_city_crossing = nil
data.raw['utility-constants']['default'].main_menu_simulations.fulgora_recycling_hell = nil
data.raw['utility-constants']['default'].main_menu_simulations.fulgora_nightfall = nil
data.raw['utility-constants']['default'].main_menu_simulations.fulgora_race = nil
data.raw['utility-constants']['default'].main_menu_simulations.aquilo_send_help = nil
data.raw['utility-constants']['default'].main_menu_simulations.aquilo_starter = nil
data.raw['utility-constants']['default'].main_menu_simulations.nauvis_rocket_factory = nil

--- Remove technologies
redmew.hide_prototype('technology', 'planet-discovery-aquilo')
redmew.hide_prototype('technology', 'planet-discovery-fulgora')
redmew.hide_prototype('technology', 'planet-discovery-gleba')
redmew.hide_prototype('technology', 'planet-discovery-vulcanus')

data.raw['autoplace-control']['aquilo_crude_oil'] = nil
data.raw['resource']['scrap'].autoplace = nil -- why is this needed? who knows... moving on...
data.raw['autoplace-control']['scrap'] = nil
data.raw['autoplace-control']['fulgora_cliff'] = nil
--data.raw['autoplace-control']['fulgora_islands'] = nil
data.raw['autoplace-control']['gleba_stone'] = nil
data.raw['autoplace-control']['gleba_cliff'] = nil
data.raw['autoplace-control']['vulcanus_coal'] = nil

data:extend({
    {
        type = 'noise-function',
        name = 'scattered_entity',
        parameters = { 'scale', 'reseed' },
        expression = '-1.5 + rpi(0.2) + decorative_mix_noise{seed = 5000 + reseed, input_scale = scale} - min(0, decorative_knockout)'
    },
})

--- Remove surface conditions for every entry that has surface condition
for _, _type in pairs(data.raw) do
    for _, name in pairs(_type) do
        if name.surface_conditions then
            name.surface_conditions = nil
        end
    end
end

local mgs = data.raw.planet.nauvis.map_gen_settings
mgs.autoplace_controls['gleba_enemy_base'] = {}
mgs.territory_settings = {
    units = { 'small-demolisher', 'medium-demolisher', 'big-demolisher' },
    territory_index_expression = 'demolisher_territory_expression',
    territory_variation_expression = 'demolisher_variation_expression',
    minimum_territory_size = 10,
}

local autoplace_settings = {
    tile = {
        --- Vulcanus
        --['lava-hot'] = {},
        --['lava'] = {},
        --['volcanic-ash-cracks'] = {},
        --['volcanic-ash-dark'] = {},
        --['volcanic-ash-flats'] = {},
        --['volcanic-ash-light'] = {},
        --['volcanic-ash-soil'] = {},
        --['volcanic-cracks-hot'] = {},
        --['volcanic-cracks-warm'] = {},
        --['volcanic-cracks'] = {},
        --['volcanic-folds-flat'] = {},
        --['volcanic-folds-warm'] = {},
        --['volcanic-folds'] = {},
        --['volcanic-jagged-ground'] = {},
        --['volcanic-pumice-stones'] = {},
        --['volcanic-smooth-stone-warm'] = {},
        --['volcanic-smooth-stone'] = {},
        --['volcanic-soil-dark'] = {},
        --['volcanic-soil-light'] = {},
        --- Gleba
        --['gleba-deep-lake'] = {},
        --['highland-dark-rock-2'] = {},
        --['highland-dark-rock'] = {},
        --['highland-yellow-rock'] = {},
        --['lowland-brown-blubber'] = {},
        --['lowland-cream-cauliflower-2'] = {},
        --['lowland-cream-cauliflower'] = {},
        --['lowland-cream-red'] = {},
        --['lowland-dead-skin-2'] = {},
        --['lowland-dead-skin'] = {},
        --['lowland-olive-blubber-2'] = {},
        --['lowland-olive-blubber-3'] = {},
        --['lowland-olive-blubber'] = {},
        --['lowland-pale-green'] = {},
        --['lowland-red-infection'] = {},
        --['lowland-red-vein-2'] = {},
        --['lowland-red-vein-3'] = {},
        --['lowland-red-vein-4'] = {},
        --['lowland-red-vein-dead'] = {},
        --['lowland-red-vein'] = {},
        --['midland-cracked-lichen-dark'] = {},
        --['midland-cracked-lichen-dull'] = {},
        --['midland-cracked-lichen'] = {},
        --['midland-turquoise-bark-2'] = {},
        --['midland-turquoise-bark'] = {},
        --['midland-yellow-crust-2'] = {},
        --['midland-yellow-crust-3'] = {},
        --['midland-yellow-crust-4'] = {},
        --['midland-yellow-crust'] = {},
        --['natural-jellynut-soil'] = {},
        --['natural-yumako-soil'] = {},
        --['pit-rock'] = {},
        --['wetland-blue-slime'] = {},
        --['wetland-dead-skin'] = {},
        --['wetland-green-slime'] = {},
        --['wetland-jellynut'] = {},
        --['wetland-light-dead-skin'] = {},
        --['wetland-light-green-slime'] = {},
        --['wetland-pink-tentacle'] = {},
        --['wetland-red-tentacle'] = {},
        --['wetland-yumako'] = {},
        --- Fulgora
        --['fulgoran-conduit'] = {},
        --['fulgoran-dunes'] = {},
        --['fulgoran-dust'] = {},
        --['fulgoran-machinery'] = {},
        --['fulgoran-paving'] = {},
        --['fulgoran-rock'] = {},
        --['fulgoran-sand'] = {},
        --['fulgoran-walls'] = {},
        --['oil-ocean-deep'] = {},
        --['oil-ocean-shallow'] = {},
        --- Aquilo
        --['ammoniacal-ocean-2'] = {},
        --['ammoniacal-ocean'] = {},
        --['brash-ice'] = {},
        --['ice-rough'] = {},
        --['ice-smooth'] = {},
        --['snow-crests'] = {},
        --['snow-flat'] = {},
        --['snow-lumpy'] = {},
        --['snow-patchy'] = {},
    },
    decorative = {
        --- Vulcanus
        ['calcite-stain-small'] = {},
        ['calcite-stain'] = {},
        ['crater-large'] = {},
        ['crater-small'] = {},
        ['medium-volcanic-rock'] = {},
        ['pumice-relief-decal'] = {},
        ['small-sulfur-rock'] = {},
        ['small-volcanic-rock'] = {},
        ['sulfur-rock-cluster'] = {},
        ['sulfur-stain-small'] = {},
        ['sulfur-stain'] = {},
        ['sulfuric-acid-puddle-small'] = {},
        ['sulfuric-acid-puddle'] = {},
        ['tiny-rock-cluster'] = {},
        ['tiny-sulfur-rock'] = {},
        ['tiny-volcanic-rock'] = {},
        ['v-brown-carpet-grass'] = {},
        ['v-brown-hairy-grass'] = {},
        ['v-green-hairy-grass'] = {},
        ['v-red-pita'] = {},
        ['vulcanus-crack-decal-huge-warm'] = {},
        ['vulcanus-crack-decal-large'] = {},
        ['vulcanus-dune-decal'] = {},
        ['vulcanus-lava-fire'] = {},
        ['vulcanus-rock-decal-large'] = {},
        ['vulcanus-sand-decal'] = {},
        ['waves-decal'] = {},
        --- Gleba
        ['barnacles-decal'] = {},
        ['black-sceptre'] = {},
        ['blood-grape-vibrant'] = {},
        ['blood-grape'] = {},
        ['brambles'] = {},
        ['brown-cup'] = {},
        ['coral-land'] = {},
        ['coral-stunted-grey'] = {},
        ['coral-stunted'] = {},
        ['coral-water'] = {},
        ['cracked-mud-decal'] = {},
        ['cream-nerve-roots-veins-dense'] = {},
        ['cream-nerve-roots-veins-sparse'] = {},
        ['curly-roots-orange'] = {},
        ['dark-mud-decal'] = {},
        ['fuchsia-pita'] = {},
        ['green-bush-mini'] = {},
        ['green-carpet-grass'] = {},
        ['green-croton'] = {},
        ['green-cup'] = {},
        ['green-hairy-grass'] = {},
        ['green-lettuce-lichen-1x1'] = {},
        ['green-lettuce-lichen-3x3'] = {},
        ['green-lettuce-lichen-6x6'] = {},
        ['green-lettuce-lichen-water-1x1'] = {},
        ['green-lettuce-lichen-water-3x3'] = {},
        ['green-lettuce-lichen-water-6x6'] = {},
        ['green-pita-mini'] = {},
        ['green-pita'] = {},
        ['grey-cracked-mud-decal'] = {},
        ['honeycomb-fungus-1x1'] = {},
        ['honeycomb-fungus-decayed'] = {},
        ['honeycomb-fungus'] = {},
        ['knobbly-roots-orange'] = {},
        ['knobbly-roots'] = {},
        ['lichen-decal'] = {},
        ['light-mud-decal'] = {},
        ['matches-small'] = {},
        ['mycelium'] = {},
        ['pale-lettuce-lichen-1x1'] = {},
        ['pale-lettuce-lichen-3x3'] = {},
        ['pale-lettuce-lichen-6x6'] = {},
        ['pale-lettuce-lichen-cups-1x1'] = {},
        ['pale-lettuce-lichen-cups-3x3'] = {},
        ['pale-lettuce-lichen-cups-6x6'] = {},
        ['pale-lettuce-lichen-water-1x1'] = {},
        ['pale-lettuce-lichen-water-3x3'] = {},
        ['pale-lettuce-lichen-water-6x6'] = {},
        ['pink-lichen-decal'] = {},
        ['pink-phalanges'] = {},
        ['polycephalum-balloon'] = {},
        ['polycephalum-slime'] = {},
        ['purple-nerve-roots-veins-dense'] = {},
        ['purple-nerve-roots-veins-sparse'] = {},
        ['red-desert-bush'] = {},
        ['red-lichen-decal'] = {},
        ['red-nerve-roots-veins-dense'] = {},
        ['red-nerve-roots-veins-sparse'] = {},
        ['red-pita'] = {},
        ['shroom-decal'] = {},
        ['solo-barnacle'] = {},
        ['split-gill-1x1'] = {},
        ['split-gill-2x2'] = {},
        ['split-gill-dying-1x1'] = {},
        ['split-gill-dying-2x2'] = {},
        ['split-gill-red-1x1'] = {},
        ['split-gill-red-2x2'] = {},
        ['veins-small'] = {},
        ['veins'] = {},
        ['white-carpet-grass'] = {},
        ['white-desert-bush'] = {},
        ['wispy-lichen'] = {},
        ['yellow-coral'] = {},
        ['yellow-lettuce-lichen-1x1'] = {},
        ['yellow-lettuce-lichen-3x3'] = {},
        ['yellow-lettuce-lichen-6x6'] = {},
        ['yellow-lettuce-lichen-cups-1x1'] = {},
        ['yellow-lettuce-lichen-cups-3x3'] = {},
        ['yellow-lettuce-lichen-cups-6x6'] = {},
        --- Fulgora
        ['fulgoran-gravewort'] = {},
        ['fulgoran-ruin-tiny'] = {},
        ['medium-fulgora-rock'] = {},
        ['small-fulgora-rock'] = {},
        ['tiny-fulgora-rock'] = {},
        ['urchin-cactus'] = {},
        --- Aquilo
        ['aqulio-ice-decal-blue'] = {},
        ['aqulio-snowy-decal'] = {},
        ['floating-iceberg-large'] = {},
        ['floating-iceberg-small'] = {},
        ['lithium-iceberg-medium'] = {},
        ['lithium-iceberg-small'] = {},
        ['lithium-iceberg-tiny'] = {},
        ['snow-drift-decal'] = {},
    },
    entity = {
        --- Vulcanus
        ['huge-volcanic-rock'] = {},
        ['big-volcanic-rock'] = {},
        --['crater-cliff'] = {},
        ['vulcanus-chimney'] = {},
        ['vulcanus-chimney-faded'] = {},
        ['vulcanus-chimney-cold'] = {},
        ['vulcanus-chimney-short'] = {},
        ['vulcanus-chimney-truncated'] = {},
        ['ashland-lichen-tree'] = {},
        ['ashland-lichen-tree-flaming'] = {},
        --- Gleba
        ['iron-stromatolite'] = {},
        ['copper-stromatolite'] = {},
        --- Fulgora
        --['scrap'] = {},
        ['fulgoran-ruin-vault'] = {},
        ['fulgoran-ruin-attractor'] = {},
        ['fulgoran-ruin-colossal'] = {},
        ['fulgoran-ruin-huge'] = {},
        ['fulgoran-ruin-big'] = {},
        ['fulgoran-ruin-stonehenge'] = {},
        ['fulgoran-ruin-medium'] = {},
        ['fulgoran-ruin-small'] = {},
        ['fulgurite'] = {},
        ['big-fulgora-rock'] = {},
        --- Aquilo
        ['lithium-iceberg-big'] = {},
        --['lithium-iceberg-huge'] = {},
    },
}

local function index_of(tbl, key)
    local c = 0
    for k in pairs(tbl) do
        if k == key then
            return c
        end
        c = c + 1
    end
    return c
end

for setting, set in pairs(autoplace_settings) do
    mgs[setting] = mgs[setting] or { settings = {} }
    for k, v in pairs(set) do
        mgs.autoplace_settings[setting].settings[k] = v
        if setting == 'decorative' then
            data.raw['optimized-decorative'][k].autoplace = {
                probability_expression = string.format('scattered_entity{ scale = 8, reseed = 17 * %d }', index_of(autoplace_settings.decorative ,k)),
            }
        end
    end
end

for name, _ in pairs(autoplace_settings.entity) do
    local entity = data.raw['simple-entity'][name] or data.raw.tree[name] or data.raw['lightning-attractor'][name]
    if entity then
        entity.autoplace.probability_expression = 'multiplier * control * (region_box + rock_density - penalty)'
        entity.autoplace.local_expressions = {
            multiplier = 0.17,
            penalty = 1.6,
            region_box = 'range_select_base(moisture, 0.35, 1, 0.2, -10, 0)',
            control = 'control:rocks:size',
        }
    end
end
