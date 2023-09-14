local Lighting = game:GetService("Lighting")
Lighting.OutdoorAmbient = Color3.fromRGB(121,117,109)
Lighting.ColorShift_Top = Color3.fromRGB(157,129,99)
Lighting.Ambient = Color3.fromRGB(147,147,147)
Lighting.ClockTime = 14.8
Lighting.GeographicLatitude = 32.3
Lighting.GlobalShadows = false
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end