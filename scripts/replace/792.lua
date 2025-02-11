wait()

game.Lighting.Ambient = Color3.new(0.7,0.7,0.7)
game.Lighting.FogEnd = 100000
game.Lighting.FogStart = 0
game.Lighting.GlobalShadows = false
game.Lighting.Brightness = 1

local sky = Instance.new("Sky")
sky.Parent = game.Lighting
sky.SkyboxBk = "rbxassetid://929189501"
sky.SkyboxDn = "rbxassetid://929190715"
sky.SkyboxFt = "rbxassetid://929190820"
sky.SkyboxLf = "rbxassetid://929190948"
sky.SkyboxRt = "rbxassetid://929191088"
sky.SkyboxUp = "rbxassetid://929191195"
sky.CelestialBodiesShown = false