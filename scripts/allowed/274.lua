local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(75,75,75)
Lighting.OutdoorAmbient = Color3.fromRGB(162,162,162)
Lighting.Outlines = false
Lighting.GlobalShadows = true
local skybox = script.Parent.Sky
skybox.Parent = Lighting
