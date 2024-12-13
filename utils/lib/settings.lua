-- SETTINGS UTIL LIBRARY
--=================================================================================================

redmew.force_setting = function(setting_type, setting_name, value)
  local setting = data.raw[setting_type .. '-setting'][setting_name]
  if not setting then
    log('Error: missing setting ' .. setting_type .. '/' .. setting_name)
    return
  end

  if setting_type == 'bool' then
    setting.forced_value = value
  else
    setting.allowed_values = { value }
  end
  setting.default_value = value
  setting.hidden = true
end
