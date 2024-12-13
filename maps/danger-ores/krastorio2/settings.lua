if not redmew.loader.enabled('do:k2') then return end

data:extend({
	{
		name = 'do_k2_win_condition',
		type = 'int-setting',
		setting_type = 'startup',
		default_value = 0,
		minimum_value = 0,
		maximum_value = 100000,
		order = 'do:l'
	},
})