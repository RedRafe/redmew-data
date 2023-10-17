if not SettingsLoader.enabled("do:k2") then return end

data:extend{
	{
		name = 'do:k2:robot_energy_multipler',
		type = 'int-setting',
		setting_type = 'startup',
		default_value = 10,
		minimum_value = 1,
		maximum_value = 100,
		order = 'a'
	},
	{
		name = 'do:k2:robot_energy_multipler_include_construction_robots',
		type = 'bool-setting',
		setting_type = 'startup',
		default_value = false,
		order = 'b'
	},
	{
		name = 'do:k2:win_condition',
		type = 'int-setting',
		setting_type = 'startup',
		default_value = 0,
		minimum_value = 0,
		maximum_value = 100000,
		order = 'i'
	},
}