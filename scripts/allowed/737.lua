local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.new(0.4,0.4,0.4)
Lighting.Outlines = false
Lighting.GlobalShadows = false
script.Parent.Skybox.Parent = Lighting
