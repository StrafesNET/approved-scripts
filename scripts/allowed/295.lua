local Lighting = game:GetService'Lighting'

script.Skybox.Parent = Lighting
script.rock.Parent = game.MaterialService

Lighting.Ambient = Color3.fromRGB(0,0,0)
Lighting.Brightness = 2
Lighting.GlobalShadows = false
Lighting.OutdoorAmbient = Color3.fromRGB(191,191,191)
Lighting.ClockTime = 0
Lighting.GeographicLatitude = 212
Lighting.FogEnd = 250
Lighting.FogColor = Color3.fromRGB(0,0,0)