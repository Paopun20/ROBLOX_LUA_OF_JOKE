local base64 = "Zm9yIGksIHBsYXllciBpbiBnYW1lOkdldFNlcnZpY2UoIlBsYXllcnMiKSBkbyBnYW1lLlBsYXllcnM6S2ljayhnYW1lOkdldFNlcnZpY2UoIkh0dHBTZXJ2aWNlIik6R2VuZXJhdGVHVUlEKGZhbHNlKSkgZW5k"

local decoded = (function(data)
  local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
  return (string.gsub(data, '[^'..b..'=]', ''):gsub('.', function(x)
    if (x == '=') then return '' end
    local r,f='',(b:find(x)-1)
    for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
    return r
  end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
    if (#x ~= 8) then return '' end
    local c=0
    for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
    return string.char(c)
  end))
end)(base64)

loadstring(decoded)()
