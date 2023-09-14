local Lighting = game:GetService'Lighting'
Lighting.Ambient = Color3.fromRGB(124, 126, 128)
Lighting.ColorShift_Top = Color3.fromRGB(180, 155, 131)
Lighting.OutdoorAmbient = Color3.fromRGB(118, 108, 95)
Lighting.Brightness = 2
Lighting.Outlines = false
Lighting.GlobalShadows = true
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end