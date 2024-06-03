local lighting = game.Lighting

lighting.Ambient = Color3.fromRGB(175, 175, 175)
lighting.Brightness = 0.5
lighting.GlobalShadows = true
lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
lighting.ClockTime = 14

local sky = script.Sky
sky.Parent = lighting

local atmosphere = script.Atmosphere
atmosphere.Parent = lighting