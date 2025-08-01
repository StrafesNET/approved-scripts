local Lighting = game:GetService("Lighting")
local Material = game:GetService("MaterialService")
Lighting.Ambient = Color3.fromRGB(125, 131, 145)
Lighting.OutdoorAmbient = Color3.fromRGB(142, 162, 167) --=255, 251, 230
Lighting.ColorShift_Top = Color3.fromRGB(143, 144, 111) --= alt 143, 144, 111
Lighting.Outlines = true
Lighting.GlobalShadows = true
Lighting.Brightness = 2.5
Lighting.EnvironmentSpecularScale = 1
Lighting.EnvironmentDiffuseScale = 1 
Lighting.ClockTime = 12.316
Lighting.GeographicLatitude = -6.176
Lighting.TimeOfDay = 12.18
script:WaitForChild("2K Realistic PBR Grass").Parent = Material
script:WaitForChild("Glossy Stylized Blocks").Parent = Material
script:WaitForChild("Angled Blocks Vegetation").Parent = Material
script:WaitForChild("Good14").Parent = Material
script:WaitForChild("MarbleFloor").Parent = Material
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end