local tick=tick
local wait=wait
local abs=math.abs
while wait() do
	script.Parent.Transparency = 0.7*abs(1-tick()%2)
end 


