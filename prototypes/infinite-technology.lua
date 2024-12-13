local function ingredients()
	return {
		{ "automation-science-pack", 1 },
		{ "logistic-science-pack", 1 },
		{ "military-science-pack", 1 },
		{ "chemical-science-pack", 1 },
		{ "production-science-pack", 1 },
		{ "utility-science-pack", 1 },
		{ "space-science-pack", 1 },
	}
end

data:extend({
	-- Robot cargo capacity
	{
		type = "technology",
		name = "worker-robots-storage-4",
		icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
		effects = {
			{
				type = "worker-robot-storage",
				modifier = 1,
			},
		},
		prerequisites = { "worker-robots-storage-3", "space-science-pack" },
		unit = {
			count_formula = "1.8^(L-4)*800",
			ingredients = ingredients(),
			time = 60,
		},
		max_level = 49,
		upgrade = true,
	},
	-- Robot battery
	{
		type = "technology",
		name = "worker-robot-battery-1",
		icon = "__redmew-data__/graphics/technology/worker-robot-battery.png",
		icon_size = 128,
		effects = {
			{
				type = "worker-robot-battery",
				modifier = 0.05,
			},
		},
		prerequisites = { "robotics" },
		unit = {
			count_formula = "L*50",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "military-science-pack", 1 },
				{ "chemical-science-pack", 1 },
			},
			time = 60,
		},
		upgrade = true,
		max_level = 2,
	},
	{
		type = "technology",
		name = "worker-robot-battery-3",
		icon = "__redmew-data__/graphics/technology/worker-robot-battery.png",
		icon_size = 128,
		effects = {
			{
				type = "worker-robot-battery",
				modifier = 0.05,
			},
		},
		prerequisites = { "worker-robot-battery-1", "utility-science-pack" },
		unit = {
			count_formula = "(L-2)*100+50",
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "military-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "utility-science-pack", 1 },
			},
			time = 60,
		},
		upgrade = true,
		max_level = 4,
	},
	{
		type = "technology",
		name = "worker-robot-battery-5",
		icon = "__redmew-data__/graphics/technology/worker-robot-battery.png",
		icon_size = 128,
		effects = {
			{
				type = "worker-robot-battery",
				modifier = 0.05,
			},
		},
		prerequisites = { "worker-robot-battery-3", "production-science-pack" },
		unit = {
			count = 500,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "military-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "utility-science-pack", 1 },
			},
			time = 60,
		},
		upgrade = true,
	},
	{
		type = "technology",
		name = "worker-robot-battery-6",
		icon = "__redmew-data__/graphics/technology/worker-robot-battery.png",
		icon_size = 128,
		effects = {
			{
				type = "worker-robot-battery",
				modifier = 0.05,
			},
		},
		prerequisites = { "worker-robot-battery-5", "space-science-pack" },
		unit = {
			count_formula = "2^(L-5)*1000",
			ingredients = ingredients(),
			time = 60,
		},
		upgrade = true,
		max_level = "infinite",
	},
	-- Lab productivity
	{
		type = "technology",
		name = "research-productivity",
		icon = "__redmew-data__/graphics/technology/laboratory-productivity.png",
		icon_size = 128,
		effects = {
			{
				type = "laboratory-productivity",
				modifier = 0.10,
			},
		},
		prerequisites = { "space-science-pack" },
		unit = {
			count_formula = "1.2^L*1000",
			ingredients = ingredients(),
			time = 120,
		},
		max_level = "infinite",
		upgrade = true,
	},
})

for _, info in pairs({
	{ name = 'steel-plate', tech = 'steel-processing' },
	{ name = 'low-density-structure', tech = 'low-density-structure' },
	{ name = 'plastic-bar', tech = 'plastics' },
	{ name = 'rocket-fuel', tech = 'rocket-fuel' },
	{ name = 'processing-unit', tech = 'processing-unit' },
}) do
	data:extend({
		{
			type = "technology",
			name = info.name.."-productivity",
			icons = util.technology_icon_constant_recipe_productivity("__base__/graphics/technology/"..info.tech..".png"),
			icon_size = 256,
			effects =
			{
				{
					type = "change-recipe-productivity",
					recipe = info.name,
					change = 0.1
				}
			},
			prerequisites = {"space-science-pack", info.tech},
			unit =
			{
				count_formula = "1.5^L*1000",
				ingredients = ingredients(),
				time = 60
			},
			max_level = "infinite",
			upgrade = true
		}
	})
end