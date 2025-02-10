local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(51,53,41)
Lighting.Outlines = false
Lighting.GlobalShadows = true
Lighting.OutdoorAmbient = Color3.fromRGB(103,124,128)
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end