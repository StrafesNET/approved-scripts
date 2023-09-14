local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(210,210,210)
Lighting.OutdoorAmbient = Color3.fromRGB(128,128,128)
Lighting.Outlines = false
Lighting.GlobalShadows = true
script.Parent.Sky.Parent = Lighting
