local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(96, 111, 118)
Lighting.ColorShift_Top = Color3.fromRGB(144, 150, 111)
Lighting.OutdoorAmbient = Color3.fromRGB(129, 125, 92)
Lighting.FogColor = Color3.fromRGB(155, 160, 192)
Lighting.FogEnd = 2000
Lighting.FogStart = 350
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end
