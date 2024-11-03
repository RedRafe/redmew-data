if not SettingsLoader.enabled('do:bz') then return end

data:extend({
	{
		name = 'do_bz_cheaper_electric_drills',
		type = 'bool-setting',
		setting_type = 'startup',
		default_value = false,
		order = 'do:l'
	}
})
