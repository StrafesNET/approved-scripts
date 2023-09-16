local lighting = game:GetService'Lighting'

lighting.Brightness = 0.2
lighting.Ambient = Color3.fromRGB(180, 180, 180)
lighting.GlobalShadows = true
lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
lighting.ClockTime = 14

script.Sky.Parent = lighting