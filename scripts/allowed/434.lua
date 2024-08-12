local t = workspace.Terrain
t:FillBlock(script.Parent.CFrame, script.Parent.Size, Enum.Material.Water)
script.Parent:Destroy()

t.WaterColor = Color3.fromRGB(66, 66, 66)
t.WaterReflectance = 0.5
t.WaterTransparency = 0.7
t.WaterWaveSize = 0.1
t.WaterWaveSpeed = 3
