local Lighting = game:GetService("Lighting")
game.Lighting.OutdoorAmbient = Color3.fromRGB(140,140,140)
game.Lighting.Brightness = 10
game.Lighting.Ambient = Color3.fromRGB(70,70,70)
game.Lighting.ClockTime = 0.5
game.Lighting.GeographicLatitude = 0
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end