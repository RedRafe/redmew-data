local function get() 
  return {
    name = "Default",
    ID = "default",
    dependencies = {},
    compatibles = {},
    incompatibles = {
      ["exotic-industries"] = true,
      ["IndustrialRevolution"] = true,
      ["IndustrialRevolution3"] = true,
      ["Krastorio2"] = true,
      ["omnilib"] = true,
      ["pypostprocessing"] = true,
    }
  }
end

return get