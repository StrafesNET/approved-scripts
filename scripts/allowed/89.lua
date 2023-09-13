local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(149, 163, 172)
Lighting.OutdoorAmbient = Color3.fromRGB(97, 102, 128)
Lighting.ColorShift_Top = Color3.fromRGB(106, 106, 136)
Lighting.Brightness = 2.5
Lighting.Outlines = false
Lighting.GlobalShadows = true
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end