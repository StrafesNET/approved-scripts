local materialService = game:GetService("MaterialService")
local lighting = game:GetService("Lighting")

script.RampFace.Parent = materialService
script.RampOutline.Parent = materialService
script.Pavement2022.Parent = materialService

script.ColorCorrection.Parent = lighting
script.Bloom.Parent = lighting
script.CartoonSky.Parent = lighting
script.SunRays.Parent = lighting

for _,i in pairs(script.Parent:GetDescendants()) do
	if i:IsA("MeshPart") or i:IsA("UnionOperation") or i:IsA("IntersectOperation") then
		i.CanCollide = false
	end
end

a = 0
b= 0
wait(1)

for x,v in pairs(script.Parent:GetDescendants()) do
	if v:IsA("MeshPart") then
		b += 1
	elseif	v:IsA("UnionOperation") or v:IsA("IntersectOperation") then
		a += 1
	end
end

print("there are "..a.." unions in surf_pastel")
print("there are "..b.." meshes in surf_pastel")

lighting.Ambient = Color3.fromRGB(170,170,170)
lighting.Brightness = 2.5
lighting.EnvironmentDiffuseScale = 0.9
lighting.EnvironmentSpecularScale = 1
lighting.GlobalShadows = true
lighting.OutdoorAmbient = Color3.fromRGB(152, 152, 152)
lighting.ShadowSoftness = 0.5
lighting.ClockTime = 13.5
lighting.GeographicLatitude = 0
lighting.ExposureCompensation = -0.25