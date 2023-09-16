local lighting = game.Lighting

lighting.Brightness = 0.25
lighting.Ambient = Color3.fromRGB(106, 100, 86)
lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
lighting.GlobalShadows = true
lighting.ClockTime = 14
lighting.ShadowSoftness = 0.2

local sky = script.Sky
sky.Parent = lighting