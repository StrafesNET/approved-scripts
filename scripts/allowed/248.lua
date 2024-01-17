local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(90,90,90)
Lighting.ColorShift_Top = Color3.fromRGB(136,155,172)
Lighting.Outlines = false
Lighting.GlobalShadows = false
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end