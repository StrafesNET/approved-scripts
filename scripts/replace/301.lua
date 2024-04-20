
--If there's a folder called "warps" in the model, then remove it. If there isn't then ignore this.
--Just putting this here incase i forget to remove the folder.

wait()

game.Lighting.Ambient = Color3.new(254/255,227/255,167/255)
game.Lighting.OutdoorAmbient = Color3.new(122/255,140/255,169/255)
game.Lighting.GlobalShadows = true
game.Lighting.Brightness = 0

sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://1508016141"
sky.SkyboxDn = "rbxassetid://1508016773"
sky.SkyboxFt = "rbxassetid://1508017043"
sky.SkyboxLf = "rbxassetid://1508017450"
sky.SkyboxRt = "rbxassetid://1508017856"
sky.SkyboxUp = "rbxassetid://1508018073"
sky.CelestialBodiesShown = false
sky.StarCount = 0
sky.Parent = game.Lighting