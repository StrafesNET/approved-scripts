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
		Ambient = Color3.fromRGB(200, 200, 200),
		Brightness = 0,
		OutdoorAmbient = Color3.fromRGB(0, 0, 0),
		ClockTime = 15.4,
		GeographicLatitude = 0,
		ExposureCompensation = 0,
		EnvironmentDiffuseScale = 0,
		EnvironmentSpecularScale = 0
	},

	["Pink"] = {
		Ambient = Color3.fromRGB(200, 200, 200),
		Brightness = 1.5,
		OutdoorAmbient = Color3.fromRGB(0, 0, 0),
		ClockTime = 15.4,
		GeographicLatitude = 0,
		ExposureCompensation = 0,
		EnvironmentDiffuseScale = 0,
		EnvironmentSpecularScale = 0
	},

	["Green"] = {
		Ambient = Color3.fromRGB(200, 200, 200),
		Brightness = 1.5,
		OutdoorAmbient = Color3.fromRGB(0, 0, 0),
		ClockTime = 15.4,
		GeographicLatitude = 0,
		ExposureCompensation = 0,
		EnvironmentDiffuseScale = 0,
		EnvironmentSpecularScale = 0
	},

	["NoEffects"] = {
		Ambient = Color3.fromRGB(138, 75, 76),
		Brightness = 1,
		OutdoorAmbient = Color3.fromRGB(107, 70, 95),
		ClockTime = 12,
		ExposureCompensation = 0
	}
}

local Presets = {}
for _,Preset in script:GetChildren() do
	local PresetName = Preset.Name
	Presets[PresetName] = {
		Folder = Preset,
		Effects = Preset:GetChildren(),
		Values = ChangedValues[PresetName],
	}
end

local lighting = game:GetService("Lighting")
local camera = workspace.CurrentCamera

local DefaultLighting = Presets.Default
local currentLighting = nil

local params = OverlapParams.new()
params.FilterType = Enum.RaycastFilterType.Include
params.FilterDescendantsInstances = {script}

game:GetService("RunService").Heartbeat:Connect(function()
	local parts = workspace:GetPartBoundsInRadius(camera.CFrame.Position, 1, params)

	local newLighting = DefaultLighting
	for _, part in parts do
		newLighting = Presets[part.Name]
		break
	end

	if currentLighting ~= newLighting then
		if currentLighting then
			-- moves the effects FROM lighting TO their folder
			for _,effect in currentLighting.Effects do
				effect.Parent = currentLighting.Folder
			end
		end

		if newLighting then
			-- moves the effects FROM their folder TO lighting
			for _,effect in newLighting.Effects do
				effect.Parent = lighting
			end

			-- changes the lighting properties
			local Values = newLighting.Values
			if Values then
				for property,value in Values do
					lighting[property] = value
				end
			end
		end

		currentLighting = newLighting
	end
end)
