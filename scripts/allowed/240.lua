local Lighting = game:GetService'Lighting'
Lighting.Outlines = false
Lighting.Brightness = 2
Lighting.Ambient = Color3.fromRGB(118, 128, 132)
Lighting.OutdoorAmbient = Color3.fromRGB(112, 112, 112)
Lighting.ClockTime = 7.7
Lighting.GeographicLatitude = 231

local x = script.sky:Clone()
x.Parent = Lighting