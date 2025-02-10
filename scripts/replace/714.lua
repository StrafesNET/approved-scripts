local Lighting = game:GetService("Lighting")
game.Lighting.Ambient = Color3.fromRGB(75,100,97)
game.Lighting.OutdoorAmbient = Color3.fromRGB(72,92,127)
game.Lighting.Outlines = false
game.Lighting.GlobalShadows = false
local skybox = script.Parent.Sky
skybox.Parent = game.Lighting
