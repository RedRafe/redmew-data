require '__redmew-data__.utils.lib.lib'
redmew.loader.startup()

data:extend({
	{
		name = 'redmew_scenario',
		type = 'string-setting',
		setting_type = 'startup',
		default_value = 'vanilla',
		allowed_values = {
			'vanilla',
			'frontier',
			'diggy',
			'danger-ores',
			'crash-site',
			'april-fools',
		},
		hidden = false,
		order = '0',
	},
	{
		name = 'redmew_simple_technology_multiplier',
		type = 'bool-setting',
		setting_type = 'startup',
		default_value = false,
		hidden = false,
		order = 'a',
	},
	{
		name = 'redmew_robot_energy_multiplier',
		type = 'bool-setting',
		setting_type = 'startup',
		default_value = false,
		order = 'c'
	},
	{
		name = 'redmew_vibrant_colors',
		type = 'bool-setting',
		setting_type = 'startup',
		default_value = true,
		order = 'd'
	},
})

-- APRIL FOOLS
-- CRASH SITE
-- DANGER ORES
require 'maps.danger-ores.settings'
require 'maps.danger-ores.krastorio2.settings'
require 'maps.danger-ores.pyanodon.settings'
-- DIGGY
-- FRONTIER
-- WARMONGER
