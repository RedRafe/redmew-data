return {
  scenario_id = {
    ['vanilla']     = 'va:',
    ['april-fools'] = 'af:',
    ['crash-site']  = 'cs:',
    ['danger-ores'] = 'do:',
    ['diggy']       = 'dy:',
    ['frontier']    = 'fr:',
    ['warmonger']   = 'wm:',
  },
  package_list = {
    -- APRIL FOOLS
    require 'maps.april-fools.2024.info',
    -- CRASH SITE
    -- DANGER ORES
    require 'maps.danger-ores.bz.info',
    require 'maps.danger-ores.exotic-industries.info',
    require 'maps.danger-ores.industrial-revolution-3.info',
    require 'maps.danger-ores.krastorio2.info',
    require 'maps.danger-ores.omnimatter.info',
    require 'maps.danger-ores.pyanodon.info',
    require 'maps.danger-ores.scrap.info',
    require 'maps.danger-ores.vanilla.info',
    -- DIGGY
    require 'maps.diggy.vanilla.info',
    -- FRONTIER
    require 'maps.frontier.krastorio2.info',
    require 'maps.frontier.zombies-extended.info',
    -- WARMONGER
  },
  info_default = require 'utils.info_default'
}