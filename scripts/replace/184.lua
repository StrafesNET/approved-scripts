local lighting = game.Lighting
lighting.Outlines = false
lighting.Ambient = Color3.fromRGB(69, 161, 85)
lighting.OutdoorAmbient = Color3.fromRGB(166,204,165)
lighting.FogEnd = 800
lighting.FogColor = Color3.fromRGB (154, 177, 192)

local sky = script.Parent
sky.Parent = lighting