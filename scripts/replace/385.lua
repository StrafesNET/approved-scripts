local lighting = game.Lighting

lighting.Ambient = Color3.fromRGB(126, 126, 126)
lighting.Brightness = 2.5
lighting.ColorShift_Top = Color3.fromRGB(163, 162, 131)
lighting.OutdoorAmbient = Color3.fromRGB(255, 162, 0)
lighting.Outlines = false
lighting.ClockTime = 9
lighting.GeographicLatitude = 170

script.Sky.Parent = lighting
script.ColorCorrection.Parent = lighting