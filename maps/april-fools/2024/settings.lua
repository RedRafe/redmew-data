if not redmew.loader.enabled('af:24') then return end

data:extend({
	{
		name = 'af_24_technology_tiers',
		type = 'int-setting',
		setting_type = 'startup',
		default_value = 5,
		minimum_value = 1,
		maximum_value = 9,
		order = 'af:a'
	}
})
