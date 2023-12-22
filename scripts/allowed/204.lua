local lighting = game:GetService("Lighting")
local skybox = script.SkyBox

lighting.Outlines = false
lighting.Ambient = Color3.new(1,1,1)
lighting.GlobalShadows = false
skybox.Parent = lighting