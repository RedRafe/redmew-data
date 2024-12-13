if not redmew.loader.enabled('do:py') then return end

data:extend({
	{
		name = 'do_py_flatten_technology_cost',
		type = 'bool-setting',
		setting_type = 'startup',
		default_value = false,
		order = 'do:d'
	}
})