redmew = require '__redmew-data__.lib.settings-util'
SettingsLoader = require '__redmew-data__.lib.loader'
SettingsLoader.startup()

data:extend({
	{
		name = 'redmew_scenario',
		type = 'string-setting',
		setting_type = 'startup',
		default_value = 'vanilla',
		allowed_values = {
			'vanilla',
			'danger-ores',
			'april-fools',
			'frontier',
		},
		hidden = false,
		order = '0',
	},
})

require 'april-fools.2024.settings'

require 'danger-ores.settings'

require 'danger-ores.exotic-industries.settings'
require 'danger-ores.industrial-revolution-3.settings'
require 'danger-ores.krastorio2.settings'
require 'danger-ores.omnimatter.settings'
require 'danger-ores.pyanodon.settings'

require 'frontier.zombies-extended.settings'
