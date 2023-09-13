--lighting adjustments
light = game.Lighting
light.Outlines = false
--light.OutdoorAmbient = Color3.new((251/255), (215/255), (140/255))
light.OutdoorAmbient = Color3.fromRGB(143, 176, 214)
light.ColorShift_Top = Color3.fromRGB(251,215,140)
light.Ambient = Color3.fromRGB(130,130,130)
light.GeographicLatitude = 77
light.ClockTime = 7.7
light.FogEnd = 1200
light.FogStart = 75
light.FogColor = Color3.fromRGB(192,192,192)

----skybox
--local sky = Instance.new("Sky",game:GetService'Lighting')
--sky.Parent = light
--sky.CelestialBodiesShown = not sky.CelestialBodiesShown
--sky.SkyboxBk = "rbxassetid://3806113025"
--sky.SkyboxDn = "rbxassetid://3806113110"
--sky.SkyboxFt = "rbxassetid://3806113248"
--sky.SkyboxLf = "rbxassetid://3806113368"
--sky.SkyboxRt = "rbxassetid://3806113492"
--sky.SkyboxUp = "rbxassetid://3806113611"
--
----color correction
--local color = Instance.new("ColorCorrectionEffect",game:GetService'Lighting')
--color.Parent = light
--color.Brightness = 0.03
--color.Contrast = 0.15
--color.Saturation = -0.1
--
----bloom effect
--local bloom = Instance.new("BloomEffect",game:GetService'Lighting')
--bloom.Intensity = 0.2
--bloom.Size = 24
--bloom.Threshold = 0.8

--water color
local water = workspace.Terrain
water.WaterColor = Color3.new(92/255,91/255,68/255)
water.WaterReflectance = 0.15
water.WaterTransparency = 0.6
water.WaterWaveSize = 0
water.WaterWaveSpeed = 2

a = game.workspace:GetDescendants()
--waterScript = script.WaterAnimationScript
for i, b in pairs(a) do
	if b.Name == "WaterBlock" then
		workspace.Terrain:FillBlock(b.CFrame, b.Size, Enum.Material.Water)
		b:Destroy()
--	elseif b.Name == "WaterTextureAnimated" then		animated textures didn't work properly ingame...
--		local waterScriptCopy = waterScript:Clone()
--		waterScriptCopy.Parent = b
	end
	if b.Name == "Water" then
		b.Transparency = 1
	end
end

--waterScript:Destroy()