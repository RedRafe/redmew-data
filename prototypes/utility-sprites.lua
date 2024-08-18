local function make_sprite(name, size, p)
  local sprite = {
    type = 'sprite',
    name = name,
    filename = '__redmew-data__/graphics/icons/'..name..'.png',
    size = size or 64,
    flags = { 'not-compressed' },
  }
  for k, v in pairs(p or {}) do
    sprite[k] = v
  end
  return sprite
end

data:extend({
  make_sprite('arrow-down', 512, { scale = 0.5 }),
  make_sprite('arrow-left', 512, { scale = 0.5 }),
  make_sprite('arrow-right', 512, { scale = 0.5 }),
  make_sprite('arrow-up', 512, { scale = 0.5 }),
  make_sprite('camera', 512, { scale = 0.5 }),
  make_sprite('neon-cart', 256),
  make_sprite('neon-lightning', 256),
  make_sprite('waterfill', 128),
})
