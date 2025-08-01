local lighting = game:GetService("Lighting")

lighting.Ambient = Color3.fromRGB(30,50,30)
lighting.Brightness = 2
lighting.EnvironmentDiffuseScale = 0.5
lighting.EnvironmentSpecularScale = 1
lighting.OutdoorAmbient = Color3.fromRGB(70,70,70)
lighting.ShadowSoftness = 1
lighting.ClockTime = 11.6
lighting.GeographicLatitude = 18.5

script:WaitForChild("Sky").Parent = lighting
script:WaitForChild("Bloom").Parent = lighting

script:WaitForChild("Wood").Parent = game:GetService("MaterialService")

-- part count
local count = 0
for _,i in script.Parent:GetDescendants() do
	if i:IsA("BasePart") then
		count += 1
	end
end
print("There are "..tostring(count).." parts in the map")