local lighting = game:GetService("Lighting")
lighting.GeographicLatitude = 57.564
lighting.ClockTime = 7.754
lighting.Outlines = false
lighting.Brightness = 2
lighting.Ambient = Color3.new(0.376471, 0.447059, 0.454902)
lighting.OutdoorAmbient = Color3.new(0.392157, 0.392157, 0.392157)
lighting.ColorShift_Top = Color3.new(0.72549, 0.627451, 0.541176)
lighting.GlobalShadows = true
lighting.EnvironmentDiffuseScale = .5
lighting.EnvironmentSpecularScale = .5
workspace.Terrain:SetMaterialColor(Enum.Material.Ground,Color3.new(0.372549, 0.341176, 0.294118))
workspace.Terrain:SetMaterialColor(Enum.Material.Rock,Color3.new(0.337255, 0.372549, 0.372549))
workspace.Terrain:SetMaterialColor(Enum.Material.Sand,Color3.new(143/255, 126/255, 95/255))

for _,effect in script:GetChildren() do
	effect.Parent = lighting
end
