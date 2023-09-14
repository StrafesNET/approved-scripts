local lighting = game:GetService("Lighting")
lighting.Outlines = false
lighting.Ambient = Color3.new(40/100,40/100,40/100)
lighting.GlobalShadows = false
script.SkyBox.Parent = lighting
