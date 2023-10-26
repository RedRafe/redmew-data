if not SettingsLoader.enabled('do:k2') then return end

if mods['deadlock-beltboxes-loaders'] then
  redmew.force_setting('bool', 'deadlock-enable-beltboxes', true)
  redmew.force_setting('bool', 'deadlock-enable-loaders', false)
end