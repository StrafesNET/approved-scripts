local Lighting = game:GetService'Lighting'
Lighting.Outlines = false
Lighting.Brightness = 2
Lighting.Ambient = Color3.fromRGB(56, 61, 75)
Lighting.OutdoorAmbient = Color3.fromRGB(112, 112, 112)
Lighting.ClockTime = 7.7
Lighting.GeographicLatitude = 231
Lighting.GlobalShadows = false

script.sky.Parent = Lighting
