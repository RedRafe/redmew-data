if not SettingsLoader.enabled('do:vanilla') then return end

data:extend({
	{
		name = 'do_vanilla_cheaper_electric_drills',
		type = 'bool-setting',
		setting_type = 'startup',
		default_value = false,
		order = 'do:e'
	}
})
