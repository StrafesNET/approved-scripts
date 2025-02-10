--[[ LightingChange by RedAce
							INSTRUCTIONS
				
Put a part over the entire area you want changed with a part in the Areas folder
Create a new array in the same name as the part, and put in your new lighting values. Make sure to follow the same format as the arrays shown
If you have lighting effects, make a folder with the same name as the part and put in your lighting effects, including those that arent changing

Make sure your default lighting is set up in the Default folder and array. Do not delete the default folder and array.

You can have as many parts as you want as long as they are named correctly, and as many areas as you want as long as they are set up correctly.
There is a max range of 1000 units. Any parts more than 1000 units above the player wont be caught and so the lighting will not change if that happens.

]]

local ChangedValues = {
	["Default"] = {
		["Ambient"] = Color3.fromRGB(127,127,127),
		["Brightness"] = 2,
		["OutdoorAmbient"] = Color3.fromRGB(128,128,128),
		["ClockTime"] = 14,
		["GeographicLatitude"] = 41.733,
		["GlobalShadows"] = false
	},
	
	["456"] = {
		["ClockTime"] = 5
	}
}

local lighting = game:GetService("Lighting")
local camera = workspace.CurrentCamera

local currentLighting = "Default" -- starts on default lighting
local newLighting = ""
local changing = true
task.wait(1) -- wait for parts to load in
local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Include
params.FilterDescendantsInstances = script:GetChildren()

game:GetService("RunService").Heartbeat:Connect(function()
	local ray = workspace:Raycast(camera.CFrame.Position, Vector3.new(0,1000,0), params)
	
	if ray then
		newLighting = ray.Instance.Name
	else
		newLighting = "Default"
	end
	
	if currentLighting ~= newLighting then
		changing = true
	end
	
	if changing then
		changing = false
		if script:FindFirstChild(currentLighting) and script:FindFirstChild(newLighting) then -- makes sure it exists and there are new effects to change to
			for _,effect in pairs(lighting:GetChildren()) do -- moves the effects FROM lighting TO their folder
				effect.Parent = script[currentLighting]
			end
	
			for _,effect in pairs(script[newLighting]:GetChildren()) do -- moves the effects FROM their folder TO lighting
				effect.Parent = lighting
			end
		end
		
		for property,value in pairs(ChangedValues[newLighting]) do -- changes the lighting properties
			lighting[property] = value
		end
		currentLighting = newLighting
	end
end)