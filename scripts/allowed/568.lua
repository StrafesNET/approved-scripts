local Lighting = game:GetService("Lighting")
Lighting.GlobalShadows = false
--Lighting.ColorShift_Top = Color3.fromRGB(202, 202, 200)
--Lighting.OutdoorAmbient = Color3.fromRGB(127, 124, 120)
--Lighting.Ambient = Color3.fromRGB(90, 92, 100)
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end
