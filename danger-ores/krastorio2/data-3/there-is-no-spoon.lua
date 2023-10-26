data:extend({
  {
    type = 'finish-the-game-achievement',
    name = 'there-is-no-spoon',
    until_second = 60 * 60 * 8, -- 8 hours
    allowed_without_fight = false,
    order = 'f[limitation]-f[there-is-no-spoon]',
    icon = '__base__/graphics/achievement/there-is-no-spoon.png',
    icon_size = 128
  }
})