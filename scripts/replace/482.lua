wait(1)
local Lighting = game:GetService("Lighting")
game.Lighting.Ambient = Color3.new(1,1,1)
game.Lighting.Outlines = false
game.Lighting.GlobalShadows = false
local skybox = script.Parent.Skybox
skybox.Parent = game.Lighting
