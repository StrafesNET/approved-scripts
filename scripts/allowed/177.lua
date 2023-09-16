local tick=tick
local HSV=Color3.fromHSV
local TextLabel=script.Parent
local speed=1/(256*6)*30
game:GetService'RunService'.Stepped:connect(function()
	TextLabel.TextColor3=HSV(speed*tick()%1,1,1)
end)