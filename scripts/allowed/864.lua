local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(100,100,100)
Lighting.OutdoorAmbient = Color3.fromRGB(172,172,172)
Lighting.Outlines = false
Lighting.Brightness = 1
Lighting.GlobalShadows = true
local skybox = script.Parent.Sky
skybox.Parent = Lighting
