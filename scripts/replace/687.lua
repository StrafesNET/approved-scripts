local l = game.Lighting

l.Brightness = 0.5
l.Ambient = Color3.fromRGB(0, 0, 0)
l.OutdoorAmbient = Color3.fromRGB(80, 80, 80)
l.GlobalShadows = false
l.ClockTime = 12
l.GeographicLatitude = 25

script:WaitForChild("Night").Parent = l