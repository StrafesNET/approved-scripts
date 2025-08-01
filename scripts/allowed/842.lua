--[[ LightingChange by RedAce (thanks quat)
							INSTRUCTIONS

Put a part entirely covering the area you want changed with a part in the Areas folder
Create a new table in the same name as the part, and put in your new lighting values. Make sure to follow the same format as the arrays shown
If you have lighting effects, make a folder with the same name as the part and put in your lighting effects, including those that arent changing

Make sure your default lighting is set up in the Default folder and table. Do not delete the Default folder and table.

You can have as many parts as you want as long as they are named correctly, and as many areas as you want as long as they are set up correctly.

]]

script:WaitForChild("Clouds").Parent = workspace.Terrain

local ChangedValues = {
	["Default"] = {
		Ambient = Color3.fromRGB(125, 125, 125),
		Brightness = 8.96,
		ColorShift_Top = Color3.fromRGB(145, 141, 118),
		EnvironmentDiffuseScale = 1,
		EnvironmentSpecularScale = 1,
		GlobalShadows=false,
		OutdoorAmbient = Color3.fromRGB(70, 70, 70),
		ShadowSoftness = 0,
		ClockTime = 17.6,
		GeographicLatitude = 0,
	},

	["City"] = {
		Ambient = Color3.fromRGB(0, 61, 89),
		Brightness = 8.96,
		ColorShift_Top = Color3.fromRGB(80, 80, 80),
		EnvironmentDiffuseScale = 1,
		EnvironmentSpecularScale = 1,
		GlobalShadows=false,
		OutdoorAmbient = Color3.fromRGB(70, 70, 70),
		ShadowSoftness = 0.16,
		ClockTime = 1.6,
		GeographicLatitude = 0,
		FogColor = Color3.fromRGB(0, 0, 0),
		FogEnd = 2000,
		FogStart = 0,

	}
}

local lighting = game:GetService("Lighting")
local camera = workspace.CurrentCamera

local DefaultLighting = script:WaitForChild'Default'
local currentLighting = nil

local params = OverlapParams.new()
params.FilterType = Enum.RaycastFilterType.Include
params.FilterDescendantsInstances = {script}

local rotateSky = script:WaitForChild("Default"):WaitForChild("Sky")

local rotateSpeed = 1 -- degrees per second
local startRotation = rotateSky.SkyboxOrientation.Y

local t0 = tick()

game:GetService("RunService").Heartbeat:Connect(function()
	-- rotate sky
	local t = tick() - t0
	rotateSky.SkyboxOrientation = Vector3.new(0, (startRotation + rotateSpeed * t) % 360, 0)

	local parts = workspace:GetPartBoundsInRadius(camera.CFrame.Position, 1, params)

	local newLighting = DefaultLighting
	for _, part in parts do
		newLighting = part
		break
	end

	if currentLighting ~= newLighting then
		if currentLighting then
			-- moves the effects FROM lighting TO their folder
			for _,effect in lighting:GetChildren() do
				effect.Parent = currentLighting
			end
		end

		if newLighting then
			-- moves the effects FROM their folder TO lighting
			for _,effect in newLighting:GetChildren() do
				effect.Parent = lighting
			end
		end

		-- changes the lighting properties
		for property,value in ChangedValues[newLighting.Name] do
			lighting[property] = value
		end
		currentLighting = newLighting
	end
end)
