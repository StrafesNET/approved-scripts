local tick=tick
local HSV=Color3.fromHSV
local Part=script.Parent
local speed=10/(256*6)*30
game:GetService'RunService'.Stepped:connect(function()
	Part.Color=HSV(speed*tick()%1,1,1)
end)