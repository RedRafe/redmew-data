local Public = {}
redmew.string = Public

-- STRING UTIL LIBRARY
--=================================================================================================

---@param inputstr string
---@param start string
Public.starts_with = function(inputstr, start) 
  return inputstr:sub(1, #start) == start 
end

---@param inputstr string
---@param ending string
Public.ends_with = function(inputstr, ending)
  return ending == '' or inputstr:sub(-#ending) == ending
end


---@param inputstr string
---@param sub string
Public.contains = function(inputstr, sub)
  return inputstr:find(sub, 1, true) ~= nil
end

---@param s string
---@param old string
---@param new string
Public.replace = function(s, old, new)
  local search_start_idx = 1

  while true do
      local start_idx, end_idx = s:find(old, search_start_idx, true)
      if (not start_idx) then
          break
      end

      local postfix = s:sub(end_idx + 1)
      s = s:sub(1, (start_idx - 1)) .. new .. postfix

      search_start_idx = -1 * postfix:len()
  end

  return s
end

-- Multiply String Value
---@param text string
---@param coefficient number
Public.msv = function(text, coefficient)
  if not text then return nil end
  local n, _ = string.gsub(text, '%a', '')
  local s = string.match(text, '%a+')
  return tostring(tonumber(n) * coefficient) .. s
end

---@param name string
Public.find_base = function(name)
  return string.gsub(name, '^sp%-([1-9][0-9]?)%-', '')
end