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
})

-- APRIL FOOLS
require 'maps.april-fools.2024.settings'
-- CRASH SITE
-- DANGER ORES
require 'maps.danger-ores.settings'
require 'maps.danger-ores.exotic-industries.settings'
require 'maps.danger-ores.industrial-revolution-3.settings'
require 'maps.danger-ores.krastorio2.settings'
require 'maps.danger-ores.pyanodon.settings'
-- DIGGY
-- FRONTIER
-- WARMONGER
