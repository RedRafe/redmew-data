-- TABLE UTIL LIBRARY
-- ============================================================================

redmew.table_contains = function(tbl, x)
  for _, v in pairs(tbl) do
    if v == x then 
    return true 
    end
  end
  return false
end