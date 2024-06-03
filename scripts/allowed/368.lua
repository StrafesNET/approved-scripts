local lighting = game:GetService'Lighting'

lighting.Ambient = Color3.fromRGB(175, 175, 175)
lighting.Brightness = 0.5
lighting.GlobalShadows = true
lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
lighting.ClockTime = 14

script.Sky.Parent = lighting
script.Atmosphere.Parent = lighting