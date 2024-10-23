local Lighting = game:GetService'Lighting'

local LightingTemplate = script.Parent.Lighting

Lighting.Outlines = false
Lighting.TimeOfDay = 0
Lighting.Brightness = LightingTemplate.Brightness.Value
Lighting.FogStart = LightingTemplate.FogStart.Value
Lighting.Ambient = LightingTemplate.AmbientColor.Value
Lighting.OutdoorAmbient = LightingTemplate.OutdoorAmbientColor.Value

local Shaders = script.Parent.Shaders
Shaders.Bloom.Parent = Lighting
Shaders.ColorCorrection.Parent = Lighting
