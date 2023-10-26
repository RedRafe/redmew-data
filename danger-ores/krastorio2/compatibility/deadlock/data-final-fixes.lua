if not mods['deadlock-beltboxes-loaders'] then return end

local deadlock = _G.deadlock

local T1 = 'deadlock-stacking-1'
local T2 = 'deadlock-stacking-2'
local T3 = 'deadlock-stacking-3'
local T4 = 'deadlock-stacking-4'
local T5 = 'deadlock-stacking-5'

-- intermediates
deadlock.add_stack('battery', nil, T3, 64)
deadlock.add_stack('compact-raw-rare-metals', nil, T1, 64)
deadlock.add_stack('electric-engine-unit', nil, T3, 64)
deadlock.add_stack('engine-unit', nil, T2, 64)
deadlock.add_stack('explosives', nil, T3, 64)
deadlock.add_stack('fluoride', nil, T2, 64)
deadlock.add_stack('flying-robot-frame', nil, T3, 64)
deadlock.add_stack('lithium-chloride', nil, T2, 64)
deadlock.add_stack('low-density-structure', nil, T3, 64)
deadlock.add_stack('rocket-control-unit', nil, T3, 64)
deadlock.add_stack('rocket-fuel', nil, T3, 64)
deadlock.add_stack('uranium-ore', nil, T1, 64)
deadlock.add_stack('yellowcake', nil, T3, 64)
-- science
deadlock.add_stack('automation-science-pack', nil, T1, 64, 'tool')
deadlock.add_stack('logistic-science-pack', nil, T1, 64, 'tool')
deadlock.add_stack('military-science-pack', nil, T2, 64, 'tool')
deadlock.add_stack('chemical-science-pack', nil, T2, 64, 'tool')
deadlock.add_stack('production-science-pack', nil, T3, 64, 'tool')
deadlock.add_stack('utility-science-pack', nil, T3, 64, 'tool')
deadlock.add_stack('space-science-pack', nil, T3, 64, 'tool')
deadlock.add_stack('biters-research-data', nil, T3, 64)
deadlock.add_stack('matter-research-data', nil, T3, 64)
deadlock.add_stack('space-research-data', nil, T3, 64)
deadlock.add_stack('basic-tech-card', nil, T3, 64, 'tool')
deadlock.add_stack('matter-tech-card', nil, T3, 64, 'tool')
deadlock.add_stack('advanced-tech-card', nil, T3, 64, 'tool')
deadlock.add_stack('singularity-tech-card', nil, T3, 64, 'tool')
-- remove fuel stacks and filters
deadlock.destroy_stack('matter-stabilizer')
deadlock.destroy_stack('charged-matter-stabilizer')
deadlock.destroy_stack('empty-antimatter-fuel-cell')
deadlock.destroy_stack('charged-antimatter-fuel-cell')
deadlock.destroy_stack('pollution-filter')
deadlock.destroy_stack('used-pollution-filter')
deadlock.destroy_stack('tritium')
deadlock.destroy_stack('dt-fuel')

-- Adjust compact raw rare metals sprite
local icons = data.raw.item['deadlock-stack-compact-raw-rare-metals'].icons
icons[2].icon = '__redmew-data__/graphics/icons/cluster-rare-3.png'
icons[3].icon = '__redmew-data__/graphics/icons/cluster-rare-2.png'
icons[4].icon = '__redmew-data__/graphics/icons/cluster-rare-1.png'
icons[5] = {
  icon = '__redmew-data__/graphics/icons/cluster-rare.png',
  icon_mipmaps = 4, icon_size = 64, scale = 0.425, shift = { 0, -6 }
}

require 'stacked-recipes'
require 'stacked-matter'
