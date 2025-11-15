local lighting = game:GetService'Lighting'
lighting.FogEnd = 100000
lighting.FogStart = 0
lighting.FogColor = Color3.new(0,0,0)
lighting.Brightness = 0
lighting.OutdoorAmbient = Color3.new(0.784314, 0.784314, 0.784314)

local sky = script.Parent
sky.Parent = lighting
