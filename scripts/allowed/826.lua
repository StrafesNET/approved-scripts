local Lighting = game:GetService'Lighting'
Lighting.Brightness = 2
Lighting.Ambient = Color3.fromRGB(138,138,138)
Lighting.OutdoorAmbient = Color3.fromRGB(255,170,127)

--VELOCIRAPTORS
for k, v in script.Parent:GetDescendants() do
	if v.Name == "Trampoline" and v:FindFirstChild("Height") then
		v.Velocity = v.CFrame.UpVector * (14.14 * v.Height.Value ^ 0.5)
	elseif v.Name == "Push" and v:FindFirstChild("Power") then
		v.Velocity = v.CFrame.LookVector * v.Power.Value
	end
end
