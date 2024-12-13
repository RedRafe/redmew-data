if not redmew.loader.enabled('do:vanilla') then return end

if mods['deadlock-beltboxes-loaders'] then
  redmew.force_setting('bool', 'deadlock-enable-beltboxes', true)
  redmew.force_setting('bool', 'deadlock-enable-loaders', true)
end
