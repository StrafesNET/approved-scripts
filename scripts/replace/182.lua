local lighting = game.Lighting

lighting.Ambient = Color3.fromRGB(255, 255, 255)
lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
lighting.Brightness = 1
lighting.GlobalShadows = true
lighting.ClockTime = 14

local sky = script.Sky
sky.Parent = lighting