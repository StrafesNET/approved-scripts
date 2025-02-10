wait()

game.Lighting.TimeOfDay = script.Parent.Lighting.TimeOfDay.Value
game.Lighting.GeographicLatitude = script.Parent.Lighting.GeographicLatitude.Value
game.Lighting.Brightness = script.Parent.Lighting.Brightness.Value
game.Lighting.FogStart = script.Parent.Lighting.FogStart.Value
game.Lighting.FogEnd = script.Parent.Lighting.FogEnd.Value

game.Lighting.Ambient = script.Parent.Lighting.AmbientColor.Value
game.Lighting.OutdoorAmbient = script.Parent.Lighting.OutdoorAmbientColor.Value
game.Lighting.ColorShift_Bottom = script.Parent.Lighting.ColorShiftBottomColor.Value
game.Lighting.ColorShift_Top = script.Parent.Lighting.ColorShiftTopColor.Value
game.Lighting.FogColor = script.Parent.Lighting.FogColorColor.Value

script.Parent.Shaders.Bloom.Parent = game.Lighting
script.Parent.Shaders.ColorCorrection.Parent = game.Lighting
script.Parent.Shaders.SunRays.Parent = game.Lighting


script.Parent.Lighting.Sky.Parent = game.Lighting
game.Lighting.Outlines = false
game.Lighting.GlobalShadows = false