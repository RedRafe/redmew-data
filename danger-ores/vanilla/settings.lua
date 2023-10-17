if not SettingsLoader.enabled("do:vanilla") then return end

data:extend{
	{
		name = 'do:vanilla:robot_energy_multipler',
		type = 'int-setting',
		setting_type = 'startup',
		default_value = 10,
		minimum_value = 1,
		maximum_value = 100,
		order = 'a'
	},
	{
		name = 'do:vanilla:robot_energy_multipler_include_construction_robots',
		type = 'bool-setting',
		setting_type = 'startup',
		default_value = false,
		order = 'b'
	},
	{
		name = 'do:vanilla:ore_stack_size',
		type = 'int-setting',
		setting_type = 'startup',
		default_value = 10,
		minimum_value = 1,
		maximum_value = 10000,
		order = 'c'
	},
	{
		name = 'do:vanilla:cheaper_electric_drills',
		type = 'bool-setting',
		setting_type = 'startup',
		default_value = false,
		order = 'd'
	}
}
