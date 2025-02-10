local Lighting = game:GetService("Lighting")
Lighting.GlobalShadows = false
Lighting.EnvironmentSpecularScale = .25
Lighting.ColorShift_Top = Color3.fromRGB(247, 222, 255)
Lighting.OutdoorAmbient = Color3.fromRGB(127, 109, 130)
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end