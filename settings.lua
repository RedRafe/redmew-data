redmew = require '__redmew-data__.lib.settings-util'
SettingsLoader = require '__redmew-data__.lib.loader'
SettingsLoader.startup()

data:extend({
	{
		name = 'redmew:scenario',
		type = 'string-setting',
		setting_type = 'startup',
		default_value = 'danger-ores',
		allowed_values = {
			'danger-ores',
		},
		hidden = false,
		order = '0',
	},
})

require 'danger-ores.settings'

require 'danger-ores.bz.settings'
require 'danger-ores.exotic-industries.settings'
require 'danger-ores.industrial-revolution-3.settings'
require 'danger-ores.krastorio2.settings'
require 'danger-ores.omnimatter.settings'
require 'danger-ores.pyanodon.settings'
require 'danger-ores.vanilla.settings'
