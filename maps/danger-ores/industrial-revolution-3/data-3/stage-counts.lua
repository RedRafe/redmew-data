for _, name in pairs({
    'coal',
    'copper-ore',
    'iron-ore',
    'stone',
    'gold-ore',
    'tin-ore'
  }) do
  local res = data.raw.resource[name]
  if res and res.stage_counts and type(res.stage_counts) == 'table' then
    for i, count in pairs(res.stage_counts) do
      res.stage_counts[i] = math.max(1, math.ceil(count / 10))
    end
  end
end