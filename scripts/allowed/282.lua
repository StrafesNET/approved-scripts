local Lighting = game:GetService'Lighting'
Lighting.Ambient = Color3.fromRGB(138,138,138)
Lighting.Brightness = 2
Lighting.GlobalShadows = false
Lighting.OutdoorAmbient = Color3.fromRGB(128,128,128)
Lighting.ShadowSoftness = 0
Lighting.ClockTime = 14
Lighting.GeographicLatitude = 41.733

script.Atmosphere.Parent = Lighting
script.Sky.Parent = Lighting
script.Bloom.Parent = Lighting