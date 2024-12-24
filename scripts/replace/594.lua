local l = game.Lighting
l.Ambient = Color3.fromRGB(138, 138, 138)
l.Brightness = 2
l.ColorShift_Top = Color3.fromRGB(0, 0, 0)
l.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
l.ClockTime = 14
l.GeographicLatitude = 41.733

script.Parent:FindFirstChildOfClass("Sky").Parent = l
script.Parent:FindFirstChildOfClass("Clouds").Parent = workspace.Terrain