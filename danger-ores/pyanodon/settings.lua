if not SettingsLoader.enabled('do:py') then return end

data:extend({
	{
		name = 'do:py:flatten_technology_cost',
		type = 'bool-setting',
		setting_type = 'startup',
		default_value = false,
		order = 'do:d'
	}
})