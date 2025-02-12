--[[ LightingChange by RedAce (thanks quat)
							INSTRUCTIONS
				
Put a part entirely covering the area you want changed with a part in the Areas folder
Create a new table in the same name as the part, and put in your new lighting values. Make sure to follow the same format as the arrays shown
If you have lighting effects, make a folder with the same name as the part and put in your lighting effects, including those that arent changing

Make sure your default lighting is set up in the Default folder and table. Do not delete the Default folder and table.

You can have as many parts as you want as long as they are named correctly, and as many areas as you want as long as they are set up correctly.

]]

local ChangedValues = {
	["Default"] = {
		Ambient = Color3.fromRGB(0,0,0),
		Brightness = 0.74,
		OutdoorAmbient = Color3.fromRGB(72, 72, 72),
		ClockTime = 8,
		GeographicLatitude = 41.733,
		FogColor = Color3.fromRGB(192,192,192),
	},
	
	["Changed"] = {
		Brightness = 2,
		OutdoorAmbient = Color3.fromRGB(128,128,128),
		ClockTime = 14,
	}
}

local lighting = game:GetService("Lighting")
local camera = workspace.CurrentCamera

local DefaultLighting = script:WaitForChild'Default'
local currentLighting = nil

local params = OverlapParams.new()
params.FilterType = Enum.RaycastFilterType.Include
params.FilterDescendantsInstances = {script}

game:GetService("RunService").Heartbeat:Connect(function()
	local parts = workspace:GetPartBoundsInRadius(camera.CFrame.Position, 1, params)

	local newLighting = DefaultLighting
	for _, part in parts do
		newLighting = part
		break
	end

	if currentLighting ~= newLighting then
		if currentLighting then
			for _,effect in lighting:GetChildren() do -- moves the effects FROM lighting TO their folder
				effect.Parent = currentLighting
			end
		end

		if newLighting then
			for _,effect in newLighting:GetChildren() do -- moves the effects FROM their folder TO lighting
				effect.Parent = lighting
			end
		end

		for property,value in ChangedValues[newLighting.Name] do -- changes the lighting properties
			lighting[property] = value
		end
		currentLighting = newLighting
	end
end)

-- im sorry im going to hack this in for now and will add terrain later
workspace.Terrain:SetMaterialColor(Enum.Material.Grass, Color3.fromRGB(36,53,25))