lighting = game:GetService("Lighting")
lighting.Outlines = false
lighting.Brightness = 2
lighting.Ambient = Color3.new(1, 0.85098, 0.960784)
lighting.GlobalShadows = false

script["Sky"].Parent = lighting
