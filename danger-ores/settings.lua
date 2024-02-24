data:extend({
	{
		name = 'do:enable_waterfill',
		type = 'bool-setting',
		setting_type = 'startup',
		default_value = true,
		order = 'do:a'
	},
	{
		name = 'do:ore_stack_size',
		type = 'int-setting',
		setting_type = 'startup',
		default_value = 10,
		minimum_value = 0,
		maximum_value = 100000,
		order = 'do:b'
	},
	{
		name = 'do:robot_energy_multipler',
		type = 'int-setting',
		setting_type = 'startup',
		default_value = 10,
		minimum_value = 1,
		maximum_value = 100,
		order = 'do:c'
	},
	{
		name = 'do:robot_energy_multipler_include_construction_robots',
		type = 'bool-setting',
		setting_type = 'startup',
		default_value = false,
		order = 'do:d'
	},
})
