local Lighting = game:GetService'Lighting'
Lighting.Ambient = Color3.new(0.3,0.3,0.3)
Lighting.GlobalShadows = false
Lighting.Brightness = 0
Lighting.Outlines = false
script.Parent.Sky.Parent = Lighting
