local Lighting = game:GetService'Lighting'
Lighting.TimeOfDay = script.Parent.Lighting.TimeOfDay.Value
Lighting.GeographicLatitude = script.Parent.Lighting.GeographicLatitude.Value
Lighting.Brightness = script.Parent.Lighting.Brightness.Value
Lighting.FogStart = script.Parent.Lighting.FogStart.Value
Lighting.FogEnd = script.Parent.Lighting.FogEnd.Value

Lighting.Ambient = script.Parent.Lighting.AmbientColor.Value
Lighting.OutdoorAmbient = script.Parent.Lighting.OutdoorAmbientColor.Value
Lighting.ColorShift_Bottom = script.Parent.Lighting.ColorShiftBottomColor.Value
Lighting.ColorShift_Top = script.Parent.Lighting.ColorShiftTopColor.Value
Lighting.FogColor = script.Parent.Lighting.FogColorColor.Value

script.Parent.Shaders.Bloom.Parent = Lighting
script.Parent.Shaders.ColorCorrection.Parent = Lighting
script.Parent.Shaders.SunRays.Parent = Lighting

script.Parent.Lighting.Sky.Parent = Lighting
