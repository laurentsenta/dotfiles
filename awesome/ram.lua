function activeram()
  local active, total
  for line in io.lines('/proc/meminfo') do
    for key, value in string.gmatch(line, "(%w+):\ +(%d+).+") do
      if key == "Active" then active = tonumber(value)
      elseif key == "MemTotal" then total = tonumber(value) end
    end
  end

  val = (active/total) * 100

  if val < 25 then
      col = "green"
  elseif val > 75 then
      col = "red"
  else
      col = "white"
  end

  content = string.format("%02d%%", val)
  content = "<span color=\""..col.."\">ram:</span>"..content
  return content
end
