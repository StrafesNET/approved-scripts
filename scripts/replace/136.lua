local lighting = game:GetService("Lighting")
local skybox = script.SkyBox

lighting.Outlines = false
lighting.Ambient = Color3.new(40/100,40/100,40/100)
lighting.GlobalShadows = false
skybox.Parent = lighting
