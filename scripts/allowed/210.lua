local tick=tick
local Decal1=script.Parent.Decal1
local Decal2=script.Parent.Decal2
local speed=5
game:GetService'RunService'.Stepped:connect(function()
	local enable=speed*tick()%1<0.5
	Decal1.Transparency=enable and 1 or 0
	Decal2.Transparency=enable and 0 or 1
end)