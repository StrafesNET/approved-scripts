local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(108,108,147)
Lighting.OutdoorAmbient = Color3.fromRGB(107,119,149)
Lighting.ColorShift_Top = Color3.fromRGB(183,218,255)
Lighting.EnvironmentDiffuseScale = 1
Lighting.EnvironmentSpecularScale = 1
Lighting.Outlines = false
Lighting.GlobalShadows = true
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end
