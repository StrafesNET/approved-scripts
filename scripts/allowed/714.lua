local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(75,100,97)
Lighting.OutdoorAmbient = Color3.fromRGB(72,92,127)
Lighting.Outlines = false
Lighting.GlobalShadows = false
script.Parent.Sky.Parent = Lighting
