local function get() 
  return {
    name = 'Default',
    ID = 'default',
    dependencies = {},
    compatibles = {},
    incompatibles = {
      ['bzcarbon'] = true,
      ['bzgold'] = true,
      ['bztitanium'] = true,
      ['bztungsten'] = true,
      ['exotic-industries'] = true,
      ['IndustrialRevolution'] = true,
      ['IndustrialRevolution3'] = true,
      ['Krastorio2'] = true,
      ['omnilib'] = true,
      ['pypostprocessing'] = true,
      ['scrap-resource'] = true,
      ['zombiesextended-core'] = true,
    }
  }
end

return get