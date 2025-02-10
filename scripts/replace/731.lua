local tick=tick
local wait=wait
local Bulb=script.Parent
while wait() do
	local t=tick()%4
	if t<1 then
		Bulb.Transparency=4*t*(1-t)
	else
		Bulb.Transparency=0
	end
end