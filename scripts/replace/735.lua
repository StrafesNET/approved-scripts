wait(1)
local Lighting = game:GetService("Lighting")
game.Lighting.Ambient = Color3.fromRGB(100,100,100)
game.Lighting.OutdoorAmbient = Color3.fromRGB(172,172,172)
game.Lighting.Outlines = false
game.Lighting.Brightness = 3
game.Lighting.GlobalShadows = true
local skybox = script.Parent.Sky
skybox.Parent = game.Lighting
