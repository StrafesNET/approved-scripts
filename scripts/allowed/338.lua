local lighting = game:GetService'Lighting'
lighting.Outlines = false
lighting.Ambient = Color3.fromRGB(85, 94, 99)
lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)

local sky = script.Parent
sky.Parent = lighting