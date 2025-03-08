local LET_THERE_BE_LIGHT do
	for k, v in pairs({
		Brightness = 2;
		Ambient = Color3.fromRGB(138,138,138);
		OutdoorAmbient = Color3.fromRGB(255,170,127)
	}) do
		game.Lighting[k] = v
	end
end

local VELOCIRAPTORS do
	for k, v in pairs(script.Parent:GetDescendants()) do
		if v.Name == "Trampoline" and v:FindFirstChild("Height") then
			v.Velocity = v.CFrame.UpVector * (14.14 * v.Height.Value ^ 0.5)
		elseif v.Name == "Push" and v:FindFirstChild("Power") then
			v.Velocity = v.CFrame.LookVector * v.Power.Value
		end
	end
end