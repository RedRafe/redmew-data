-- cuz ZE has shared references
for _, v in pairs(data.raw.technology) do
  data:extend { table.deepcopy(v) }
end

-- Ingredients
for _, tech_name in pairs({
  'advanced-rifles-mk1',
  'battery-mk3-equipment',
  'energy-shield-mk3-equipment',
  'large-logistic-containers',
  'personal-canon-defense-equipment-mk1',
  'personal-laser-defense-equipment-mk2',
  'radar-mk2',
  'repair-pack-mk3',
  'turrets-mk1',
  'vibranium-walls-mk1',
  'vibranium-walls-mk3',
}) do redmew.remove_research_ingredient(tech_name, 'production-science-pack') end

redmew.remove_research_ingredient('heavy-water-processing', 'space-science-pack')

for ingredient, technologies in pairs({
  -- Basic science
  ['military-science-pack'] = {
    'advanced-ammo-mk3',
    'advanced-rifles-mk1',
    'advanced-rifles-mk2',
    'radar-mk1',
    'radar-mk2',
    'radar-mk3',
    'turrets-mk1',
    'vibranium-walls-mk1',
    'vibranium-walls-mk2',
    'vibranium-walls-mk3',
  },
  ['chemical-science-pack'] = {
    'radar-mk1',
  },
  ['production-science-pack'] = {
    'electric-energy-distribution-3',
    'electric-mining-drill-mk1',
    'fluid-handling-mk1',
    'high-teir-inserters-mk1',
    'oil-processing-mk1',
    'radar-mk2',
  },
  ['utility-science-pack'] = {
    'advanced-rifles-mk1',
    'battery-mk3-equipment',
    'large-logistic-containers',
    'personal-roboport-mk3-equipment',
    'repair-pack-mk3',
  },
  ['space-science-pack'] = {
    'advanced-ammo-mk3',
    'advanced-rifles-mk2',
    'advanced-robots-mk1',
    'advanced-robots-mk2',
    'assembling-machine-mk1',
    'assembling-machine-mk2',
    'assembling-machine-mk3',
    'battery-mk3-equipment',
    'battery-mk4-equipment',
    'centrifuge-mk1',
    'centrifuge-mk2',
    'electric-energy-distribution-3',
    'electric-energy-distribution-4',
    'electric-furnace-mk1',
    'electric-furnace-mk2',
    'electric-mining-drill-mk2',
    'electric-mining-drill-mk3',
    'energy-shield-mk3-equipment',
    'exoskeleton-equipment-mk2',
    'exoskeleton-equipment-mk3',
    'fluid-handling-mk2',
    'high-teir-inserters-mk1',
    'high-teir-inserters-mk2',
    'high-teir-logistics-mk1',
    'high-teir-logistics-mk2',
    'high-teir-trains-mk1',
    'high-teir-trains-mk2',
    'lab-mk2',
    'lab-mk3',
    'large-logistic-containers',
    'nuclear-fuel-mk1',
    'nuclear-fuel-mk2',
    'nuclear-fuel-mk3',
    'nuclear-mk1',
    'nuclear-mk2',
    'oil-processing-mk1',
    'oil-processing-mk2',
    'oil-processing-mk3',
    'personal-canon-defense-equipment-mk1',
    'personal-laser-defense-equipment-mk2',
    'personal-roboport-mk3-equipment',
    'personal-roboport-mk4-equipment',
    'power-armor-mk3',
    'radar-mk3',
    'reactor-equipment-mk2',
    'reactor-equipment-mk3',
    'turrets-mk1',
    'vibranium-walls-mk3',
  },
}) do
  for _, tech_name in pairs(technologies) do
    redmew.add_research_ingredient(tech_name, ingredient)
  end
end

-- Prerequisites
redmew.add_prerequisite('repair-pack-mk1', 'logistic-science-pack')
redmew.add_prerequisite('radar-mk1', 'chemical-science-pack')

redmew.add_prerequisite('turrets-mk1', 'energy-weapons-damage-6')
redmew.add_prerequisite('turrets-mk1', 'laser-shooting-speed-7')
redmew.add_prerequisite('turrets-mk1', 'physical-projectile-damage-6')
redmew.add_prerequisite('turrets-mk1', 'refined-flammables-6')
redmew.add_prerequisite('turrets-mk1', 'weapon-shooting-speed-6')

redmew.add_prerequisite('power-armor-mk3', 'energy-weapons-damage-6')
redmew.add_prerequisite('power-armor-mk3', 'laser-shooting-speed-7')
redmew.add_prerequisite('power-armor-mk3', 'physical-projectile-damage-6')
redmew.add_prerequisite('power-armor-mk3', 'refined-flammables-6')
redmew.add_prerequisite('power-armor-mk3', 'weapon-shooting-speed-6')

for prerequisite, technologies in pairs({
  ['energy-weapons-damage-7'] = {
    'personal-laser-defense-equipment-mk2',
    'power-armor-mk4',
    'turrets-mk2',
  },
  ['energy-weapons-damage-8'] = {
    'personal-canon-defense-equipment-mk1',
    'power-armor-mk5',
  },
  ['energy-weapons-damage-9'] = {
    'personal-canon-defense-equipment-mk2',
  },
  ['mining-productivity-4'] = {
    'electric-energy-distribution-3',
    'electric-mining-drill-mk2',
    'oil-processing-mk1',
    'assembling-machine-mk1',
    'centrifuge-mk1',
    'electric-furnace-mk1',
    'lab-mk1',
    'solar-mk2',
    'power-armor-mk4',
    'battery-mk3-equipment',
  },
  ['mining-productivity-5'] = {
    'electric-energy-distribution-3',
    'high-teir-trains-mk1',
    'oil-processing-mk2',
    'assembling-machine-mk2',
    'centrifuge-mk2',
    'electric-furnace-mk2',
    'lab-mk2',
    'solar-mk3',
    'battery-mk4-equipment',
  },
  ['mining-productivity-6'] = {
    'electric-mining-drill-mk2',
    'high-teir-trains-mk2',
    'solar-mk4',
  },
  ['mining-productivity-7'] = {
    'assembling-machine-mk3',
    'oil-processing-mk3',
    'centrifuge-mk3',
    'electric-furnace-mk3',
    'lab-mk3',
    'solar-mk5',
  },
  ['physical-projectile-damage-7'] = {
    'vibranium-walls-mk3',
    'advanced-rifles-mk2',
    'power-armor-mk4',
    'turrets-mk2',
  },
  ['physical-projectile-damage-8'] = {
    'advanced-ammo-mk3',
    'power-armor-mk5',
  },
  ['stronger-explosives-7'] = {
    'nuclear-mk2',
    'nuclear-fuel-mk2',
    'reactor-equipment-mk3',
  },
  ['stronger-explosives-8'] = {
    'nuclear-mk3',
    'nuclear-fuel-mk3',
    'reactor-equipment-mk4',
  },
  ['stronger-explosives-9'] = {
    'reactor-equipment-mk5',
  },
  ['worker-robots-speed-7'] = {
    'advanced-robots-mk1',
    'high-teir-inserters-mk1',
    'high-teir-logistics-mk1',
    'personal-roboport-mk3-equipment',
  },
  ['worker-robots-speed-8'] = {
    'advanced-robots-mk2',
    'high-teir-inserters-mk2',
    'high-teir-logistics-mk2',
    'personal-roboport-mk4-equipment',
  },
  ['refined-flammables-7'] = {
    'turrets-mk2',
    'fluid-handling-mk2',
    'energy-shield-mk3-equipment',
  },
  ['refined-flammables-8'] = {
    'advanced-nuclear-bombs-mk1',
    'energy-shield-mk4-equipment',
  },
}) do
  for _, tech_name in pairs(technologies) do
    redmew.add_prerequisite(tech_name, prerequisite)
  end
end
