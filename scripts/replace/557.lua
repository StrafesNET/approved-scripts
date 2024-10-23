wait()

game.Lighting.TimeOfDay = 0
game.Lighting.Brightness = script.Parent.Lighting.Brightness.Value
game.Lighting.FogStart = script.Parent.Lighting.FogStart.Value

game.Lighting.Ambient = script.Parent.Lighting.AmbientColor.Value
game.Lighting.OutdoorAmbient = script.Parent.Lighting.OutdoorAmbientColor.Value

script.Parent.Shaders.Bloom.Parent = game.Lighting
script.Parent.Shaders.ColorCorrection.Parent = game.Lighting

game.Lighting.Outlines = false