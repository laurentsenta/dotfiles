
jiffies = {}
function activecpu(rate)
    -- rate: update rate, 1 for every 1s, 2 for every 2s, etc. Used for scaling
    local s = ""
    for line in io.lines("/proc/stat") do
        local cpu, newjiffies = string.match(line, "(cpu)\ +(%d+)")
        if cpu and newjiffies then
            if not jiffies[cpu] then
                jiffies[cpu] = newjiffies
            end

	    val = (newjiffies-jiffies[cpu])/rate
	    if val < 25 then
		col = "green"
	    elseif val > 75 then
		col = "red"
	    else
		col = "white"
	    end

	    content = string.format("%02d", val) .. "%"
	    content = "<span color=\""..col.."\">cpu:</span>"..content
	    s = s..content

            jiffies[cpu] = newjiffies
        end
    end
    return s
end

