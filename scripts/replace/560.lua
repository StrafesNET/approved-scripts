local Lighting = game:GetService("Lighting")
game.Lighting.Ambient = Color3.fromRGB(210,210,210)
game.Lighting.OutdoorAmbient = Color3.fromRGB(128,128,128)
game.Lighting.Outlines = false
game.Lighting.GlobalShadows = true
local skybox = script.Parent.Sky
skybox.Parent = game.Lighting
