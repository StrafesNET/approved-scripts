local tick=tick
local Parent=script.Parent
game:GetService'RenderStepped':connect(function()
	Parent.TextColor3=Color3.fromHSV(tick()*30/256%1,1,1)
end)