local lighting = game:GetService'Lighting'
lighting.Ambient = Color3.fromRGB(84, 78, 78)
lighting.OutdoorAmbient = Color3.fromRGB(162, 159, 151)
lighting.ColorShift_Top = Color3.fromRGB(233, 230, 220)
lighting.ClockTime = 13.4
lighting.GeographicLatitude = 1
lighting.ShadowSoftness = 0.75
lighting.Brightness = 1.85

local sky = script.Parent
sky.Parent = lighting