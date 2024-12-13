local PALETTE = redmew.palette

-- Loaders
redmew.entity_friendly_color('loader-1x1', 'ei_loader',         PALETTE['yellow'])
redmew.entity_friendly_color('loader-1x1', 'ei_fast-loader',    PALETTE['red'])
redmew.entity_friendly_color('loader-1x1', 'ei_express-loader', PALETTE['blue'])

-- Neo belts
redmew.entity_friendly_color('transport-belt',   'ei_neo-belt',             PALETTE['pink'])
redmew.entity_friendly_color('underground-belt', 'ei_neo-underground-belt', PALETTE['pink'])
redmew.entity_friendly_color('splitter',         'ei_neo-splitter',         PALETTE['pink'])
redmew.entity_friendly_color('loader-1x1',       'ei_neo-loader',           PALETTE['pink'])

-- Entities
-- redmew.entity_friendly_color('assembling-machine', 'ei_advanced-centrifuge',      PALETTE['centrifuge'])
-- redmew.entity_friendly_color('assembling-machine', 'ei_advanced-chem-plant',      PALETTE['chemical-plant'])
-- redmew.entity_friendly_color('assembling-machine', 'ei_advancedoil-refinery',     PALETTE['oil-refinery'])
-- redmew.entity_friendly_color('assembling-machine', 'ei_electric-stone-quarry',    PALETTE['mining-drill'])
-- redmew.entity_friendly_color('assembling-machine', 'ei_heat-chemical-plant',      PALETTE['chemical-plant'])
-- redmew.entity_friendly_color('assembling-machine', 'ei_stone-quarry',             PALETTE['mining-drill'])
-- redmew.entity_friendly_color('furnace',            'ei_cooler',                   PALETTE['assembling-machine'])
redmew.entity_friendly_color('furnace',            'ei_high-temperature-reactor', PALETTE['reactor'])
