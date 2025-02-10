local Lighting = game:GetService("Lighting")
Lighting.ColorShift_Top = Color3.fromRGB(150, 142, 171)
Lighting.OutdoorAmbient = Color3.fromRGB(144, 144, 147)
Lighting.Brightness = 2
Lighting.EnvironmentSpecularScale = .35
Lighting.GlobalShadows = false
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end