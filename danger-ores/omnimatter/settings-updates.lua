if not SettingsLoader.enabled('do:omni') then return end

local science_str = 'chemical-science-pack,high-tech-science-pack,production-science-pack,military-science-pack,space-science-pack,datacore-war-1,angels-science-pack-orange,angels-science-pack-blue,angels-science-pack-yellow,angels-science-pack-white,datacore-exploration-1'

if mods['omnimatter'] then
  redmew.force_setting('bool', 'omnimatter-fluid-processing', true)
  redmew.force_setting('bool', 'omnimatter-infinite-omnic-acid', true)
  redmew.force_setting('bool', 'omnimatter-rocket-locked', true)
end

if mods['omnimatter_compression'] then
  -- Mandatory
  redmew.force_setting('bool', 'omnicompression_1x1_buildings', true)
  redmew.force_setting('bool', 'omnicompression_compounding_building_mults', true)
  redmew.force_setting('bool', 'omnicompression_final_building', false)
  redmew.force_setting('bool', 'omnicompression_one_list', true)

  -- Optional (enforce optimal settings)
  redmew.force_setting('bool',   'omnicompression_compensate_stacksizes', false)
  redmew.force_setting('bool',   'omnicompression_normalize_stacked_buildings', false)
  redmew.force_setting('double', 'omnicompression_cost_mult', 1)
  redmew.force_setting('double', 'omnicompression_energy_mult', 1)
  redmew.force_setting('int',    'omnicompression_building_levels', 2)
  redmew.force_setting('int',    'omnicompression_compressed_tech_min', 2000)
  redmew.force_setting('int',    'omnicompression_multiplier', 4)
  redmew.force_setting('int',    'omnicompression_too_long_time', 11000)
  redmew.force_setting('string', 'omnicompression_always_compress_sp', science_str)
end

if mods['omnimatter_energy'] then
  redmew.force_setting('int', 'omnielectricity-solar-tiers', 2)
  redmew.force_setting('int', 'omnielectricity-solar-size', 5)
end

if mods['omnimatter_crystal'] then
  redmew.force_setting('bool', 'angels-salt-sorting', true)
  redmew.force_setting('bool', 'omnicrystal-sloth', false)
end

if mods['omnimatter_permutation'] then
  redmew.force_setting('bool', 'hide_permutations', true)
end

if mods['omnimatter_water'] then
  redmew.force_setting('int', 'water-levels', 8)
end

if mods['omnimatter_wood'] then
  redmew.force_setting('bool', 'omniwood-all-mutated', true)
  redmew.force_setting('bool', 'omniwood-pure-wood-only', true)
end