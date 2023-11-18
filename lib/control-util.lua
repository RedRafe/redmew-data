local lib = {}

-- ============================================================================
-- STRING UTIL LIBRARY
lib.string = {}

---@param inputstr string
---@param start string
function lib.string.startsWith(inputstr, start) 
  return inputstr:sub(1, #start) == start 
end

-- Multiply String Value
---@param text string
---@param coefficient number
function lib.string.msv(text, coefficient)
  if not text then return nil end
  local n = string.match(text, '%d+')
  local s = string.match(text, '%a+')
  return tostring(tonumber(n) * coefficient) .. s
end

---@param name string
function lib.string.find_base(name)
  return string.gsub(name, '^sp%-([1-9][0-9]?)%-', '')
end

--=================================================================================================

return lib