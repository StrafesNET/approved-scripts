local Lighting = game:GetService("Lighting")
game.Lighting.OutdoorAmbient = Color3.fromRGB(121,117,109)
game.Lighting.ColorShift_Top = Color3.fromRGB(157,129,99)
game.Lighting.Ambient = Color3.fromRGB(147,147,147)
game.Lighting.ClockTime = 14.8
game.Lighting.GeographicLatitude = 32.3
game.Lighting.GlobalShadows = false
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end