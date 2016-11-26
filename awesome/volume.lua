local wibox = require("wibox")
local awful = require("awful")

function get_volume()
   local fd = io.popen("amixer -D pulse sget Master")
   local status = fd:read("*all")
   fd:close()

   -- local volume = tonumber(string.match(status, "(%d?%d?%d)%%")) / 100
   local volume = string.match(status, "(%d?%d?%d)%%")
   volume = string.format("% 3d", volume)

   status = string.match(status, "%[(o[^%]]*)%]")

   if string.find(status, "on", 1, true) then
       -- For the volume numbers
       volume = "🔊"..volume .. "%"
   else
       -- For the mute button
       volume = "🔇"..volume .. "M"

   end
   return volume
end

