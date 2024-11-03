data:extend({
	{
		name = 'do_enable_waterfill',
		type = 'bool-setting',
		setting_type = 'startup',
		default_value = true,
		order = 'do:a'
	},
	{
		name = 'do_ore_stack_size',
		type = 'int-setting',
		setting_type = 'startup',
		default_value = 10,
		minimum_value = 0,
		maximum_value = 100000,
		order = 'do:b'
	},
	{
		name = 'do_robot_energy_multiplier',
		type = 'int-setting',
		setting_type = 'startup',
		default_value = 10,
		minimum_value = 1,
		maximum_value = 100,
		order = 'do:c'
	},
	{
		name = 'do_robot_energy_multiplier_include_construction_robots',
		type = 'bool-setting',
		setting_type = 'startup',
		default_value = false,
		order = 'do:d'
	},
})
