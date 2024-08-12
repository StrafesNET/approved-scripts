local l = game:GetService'Lighting'
script.Atmosphere.Parent = l
script.SunRays.Parent = l
script.Sunset.Parent = l
script.ColorCorrection.Parent = l

l.Ambient = Color3.new(229/255, 90/255, 26/255)
l.Brightness = 15
l.EnvironmentDiffuseScale = 0.849
l.EnvironmentSpecularScale = 0.655
l.OutdoorAmbient = Color3.new(66/255, 22/255, 0)
l.ShadowSoftness = 0
l.ClockTime = 16.85
l.GeographicLatitude = -36.803
