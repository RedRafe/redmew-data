if not SettingsLoader.enabled('af:24') then return end

data:extend({
	{
		name = 'af:24:technology_tiers',
		type = 'int-setting',
		setting_type = 'startup',
		default_value = 5,
		minimum_value = 1,
		maximum_value = 9,
		order = 'af:a'
	}
})
