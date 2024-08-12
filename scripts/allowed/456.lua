-- This script was adjusted by aidan9382
-- Changes:
-- * Fixed bugs to do with the script not properly fixing lighting upon leaving
--    (specifically wrong brightness and no :ClearAllChildren call)
-- * Made the code into a Client context Script and moved relevant server-only code into the client
-- * Fixed the audio code to not use the player backpack and all the other weird stuff it does
print('PlayerScript start')

local lighting = game:GetService("Lighting")
local defaultLighting = script:WaitForChild("DefaultLightingValues")
local defaultSky = script:WaitForChild("Blue")
local camera = workspace.CurrentCamera

local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
--local ReplicatedStorage = game:GetService("ReplicatedStorage")
local mapName = script:WaitForChild("MapName").Value
local mapModel = workspace:WaitForChild(mapName)
local player = game:GetService("Players").LocalPlayer
local defaultAudio = script:FindFirstChildWhichIsA("Sound")
defaultAudio.Parent = mapModel

for _, v in pairs(mapModel.MusicZones.Zones:GetChildren()) do
	if v:IsA("BasePart") then
		v.Transparency = 1
	end
end

for _, v in pairs(mapModel.MusicZones.MuteButtons:GetChildren()) do
	local audioName = v:FindFirstChild("AudioName")
	local sGui = Instance.new("SurfaceGui", audioName)
	local tLabel = Instance.new("TextLabel", sGui)
	sGui.Face = "Front"
	sGui.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
	tLabel.TextScaled = true
	tLabel.TextWrapped = true
	tLabel.BackgroundTransparency = 1
	tLabel.TextStrokeTransparency = 0
	tLabel.BorderSizePixel = 0
	tLabel.Size = UDim2.new(1, 0, 1, 0)
	tLabel.Font = Enum.Font.GothamBold
	tLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
end

local mute = false
local originalVolume
for _, button in pairs(mapModel.MusicZones.MuteButtons:GetChildren()) do
	button.Mute:FindFirstChild("ClickDetector").MouseClick:Connect(function()
		if not mute then
			mute = true
			originalVolume = defaultAudio.Volume
			defaultAudio.Volume = 0
			for _, v in pairs(mapModel.MusicZones.MuteButtons:GetChildren()) do
				v:FindFirstChild("Mute").Color = Color3.fromRGB(170, 100, 100)
				v:FindFirstChild("Mute").Decal.Texture = "rbxassetid://1066885247"
			end
		elseif mute then
			mute = false
			defaultAudio.Volume = originalVolume
			for _, v in pairs(mapModel.MusicZones.MuteButtons:GetChildren()) do
				v:FindFirstChild("Mute").Color = Color3.fromRGB(152, 184, 109)
				v:FindFirstChild("Mute").Decal.Texture = "rbxassetid://1066885395"
			end
		end
	end)
end

script.Parent = workspace
mapModel.Destroying:Connect(function()
	print("Map deleted, destroying PlayerScript + AudioPlayer")
	-- Without reverting, the settings set by other maps will get overridden by this script
	lighting.Ambient = Color3.fromRGB(0,0,0)
	lighting.Brightness = 1
	lighting.ColorShift_Bottom = Color3.fromRGB(0,0,0)
	lighting.ColorShift_Top = Color3.fromRGB(0,0,0)
	lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
	lighting.ClockTime = 14
	lighting.GeographicLatitude = 41.733
	lighting.FogColor = Color3.fromRGB(192,192,192)
	lighting.FogEnd = 100000
	lighting.FogStart = 0
	lighting.GlobalShadows = true
	lighting:ClearAllChildren()
	script:Destroy()
end)

local debounce = false
local function changeAudio(audio)
	local currentSoundId = defaultAudio.SoundId
	if audio.SoundId ~= currentSoundId and not mute and not debounce then
		debounce = true
		local tweenLength = 1
		local tweenInfo = TweenInfo.new(tweenLength)
		local tween = tweenService:Create(defaultAudio, tweenInfo, {Volume=0})
		tween:Play()
		wait(tweenLength)
		defaultAudio:Stop()
		local soundObjects = 0
		local soundId = audio.SoundId
		defaultAudio.SoundId = soundId
		local newSoundId = string.gsub(soundId, "rbxassetid://", "")
		for _, v in pairs(mapModel.MusicZones.MuteButtons:GetDescendants()) do
			if v:IsA("BasePart") and v.Name == "AudioName" then
				if v:FindFirstChild("SurfaceGui") then
					v.SurfaceGui:FindFirstChild("TextLabel").Text = game:GetService("MarketplaceService"):GetProductInfo(tonumber(newSoundId)).Name
				end
			end
		end
		defaultAudio:Play()
		local tweenInfo2 = TweenInfo.new(tweenLength)
		local tween2 = tweenService:Create(defaultAudio, tweenInfo2, {Volume=audio.Volume})
		tween2:Play()
		wait(tweenLength)
		debounce = false
	elseif audio.SoundId ~= currentSoundId and mute then
		originalVolume = audio.Volume
		local soundId = audio.SoundId
		defaultAudio:Stop() -- make sure it resets to start cause i dont trust audios
		defaultAudio.SoundId = soundId
		defaultAudio:Play()
		local newSoundId = string.gsub(soundId, "rbxassetid://", "")
		for _, v in pairs(mapModel.MusicZones.MuteButtons:GetDescendants()) do
			if v:IsA("BasePart") and v.Name == "AudioName" then
				if v:FindFirstChild("SurfaceGui") then
					v.SurfaceGui:FindFirstChild("TextLabel").Text = game:GetService("MarketplaceService"):GetProductInfo(tonumber(newSoundId)).Name
				end
			end
		end
	end
end

local rayHeight = 500
local bRayHeight = 7.5
local lRayHeight = 500

local isDefaultAudio = true
changeAudio(defaultAudio)

local zones = mapModel:FindFirstChild("MusicZones").Zones
local bZones = mapModel:FindFirstChild("Buttons").Zones
--local sZones = mapModel:FindFirstChild("Stares").Zones
local lZones = mapModel:FindFirstChild("LightingChangers").Zones

print("PlayerScript startup done")

local db = false
runService.RenderStepped:Connect(function(step)
	-- Update ray and search to see if we are under any parts in MusicZones.Zones
	local ray = Ray.new(camera.CFrame.Position, Vector3.new(0, rayHeight, 0))
	local hit = workspace:FindPartOnRayWithWhitelist(ray, {zones})
	if hit then
		-- Try to locate the audio
		local NewAudio = hit:FindFirstChildWhichIsA("Sound")
		if NewAudio and not db then
			db = true
			isDefaultAudio = false
			changeAudio(NewAudio)
			wait(0.1)
			db = false
		end
	else
		-- Revert to defaults
		if not isDefaultAudio then changeAudio(defaultAudio) end
		isDefaultAudio = true
	end
end)

local bFolder = bZones.Parent
local db2 = false
runService.RenderStepped:Connect(function(step)
	local ray = Ray.new(camera.CFrame.Position, Vector3.new(0, bRayHeight, 0))
	local hit = workspace:FindPartOnRayWithWhitelist(ray, {bZones})
	if hit then
		-- if its "R" it matches no platforms, so they all reset naturally
		for _, v in pairs(bFolder.ButtonPlatforms:GetChildren()) do
			if v:IsA("BasePart") then
				if v.Name == hit.Name then
					v.Material = Enum.Material.ForceField
					if not v:FindFirstChildWhichIsA("SpecialMesh") then
						local mesh = Instance.new("SpecialMesh", v)
						mesh.TextureId = "http://www.roblox.com/asset/?id=459487304"
						mesh.VertexColor = Vector3.new(1, 0, 0)
						mesh.Scale = Vector3.new(v.Size.X, v.Size.Y, v.Size.Z)
					end
					if v:FindFirstChildWhichIsA("Decal") then
						v:FindFirstChildWhichIsA("Decal").Transparency = 1
					end
				else
					v.Material = Enum.Material.Concrete
					if v:FindFirstChildWhichIsA("SpecialMesh") then
						v:FindFirstChildWhichIsA("SpecialMesh"):Destroy()
					end
					if v:FindFirstChildWhichIsA("Decal") then
						v:FindFirstChildWhichIsA("Decal").Transparency = 0.9
					end
				end
			end
		end
	end
end)

--local stareEvent = ReplicatedStorage:WaitForChild("StareEvent")
--local sFolder = sZones.Parent
--runService.RenderStepped:Connect(function(step)
--	for _, v in pairs(sZones:GetChildren()) do
--		local isOnScreen = select(2, camera:WorldToViewportPoint(v.Position))
--		if isOnScreen then
--			stareEvent:FireServer(v, true)
--		else
--			stareEvent:FireServer(v, false)
--		end
--	end
--end)

local lFolder = lZones.Parent
runService.RenderStepped:Connect(function(step)
	local ray = Ray.new(camera.CFrame.Position, Vector3.new(0, lRayHeight, 0))
	local hit = workspace:FindPartOnRayWithWhitelist(ray, {lZones})
	if hit then
		local lValues = hit:FindFirstChild("LightingValues")
		-- Sky Values
		for _, v in pairs(lighting:GetChildren()) do
			if v.Name ~= hit:FindFirstChildWhichIsA("Sky").Name then
				v:Destroy()
				local newSky = hit:FindFirstChildWhichIsA("Sky"):Clone()
				newSky.Parent = lighting
			end
		end
		-- Lighting Values
		lighting.Ambient = lValues.Ambient.Value
		lighting.Brightness = lValues.Brightness.Value
		lighting.ClockTime = lValues.ClockTime.Value
		lighting.ColorShift_Bottom = lValues.ColorShift_Bottom.Value
		lighting.ColorShift_Top = lValues.ColorShift_Top.Value
		lighting.FogColor = lValues.FogColor.Value
		lighting.FogEnd = lValues.FogEnd.Value
		lighting.FogStart = lValues.FogStart.Value
		lighting.GeographicLatitude = lValues.GeographicLatitude.Value
		lighting.OutdoorAmbient = lValues.OutdoorAmbient.Value
		lighting.GlobalShadows = lValues.GlobalShadows.Value
	else
		-- Sky Values
		for i, v in pairs(lighting:GetChildren()) do
			if v.Name ~= defaultSky.Name then
				v:Destroy()
				local newSky = defaultSky:Clone()
				newSky.Parent = lighting
			end
		end
		if not lighting:FindFirstChildWhichIsA("Sky") then
			local newSky = defaultSky:Clone()
			newSky.Parent = lighting
		end
		-- Lighting Values
		lighting.Ambient = defaultLighting.Ambient.Value
		lighting.Brightness = defaultLighting.Brightness.Value
		lighting.ClockTime = defaultLighting.ClockTime.Value
		lighting.ColorShift_Bottom = defaultLighting.ColorShift_Bottom.Value
		lighting.ColorShift_Top = defaultLighting.ColorShift_Top.Value
		lighting.FogColor = defaultLighting.FogColor.Value
		lighting.FogEnd = defaultLighting.FogEnd.Value
		lighting.FogStart = defaultLighting.FogStart.Value
		lighting.GeographicLatitude = defaultLighting.GeographicLatitude.Value
		lighting.OutdoorAmbient = defaultLighting.OutdoorAmbient.Value
		lighting.GlobalShadows = defaultLighting.GlobalShadows.Value
	end
end)

--for _, v in pairs(sFolder.Parts:GetChildren()) do
--	if v:FindFirstChild("IsTrigger") then
--		local cframe = Instance.new("CFrameValue", v)
--		cframe.Name = "originalCFrame"
--		cframe.Value = v.CFrame
--	end
--end

for _, v in pairs(mapModel.MusicZones.MuteButtons:GetChildren()) do
	v.AudioName.DescendantAdded:Connect(function(descendant)
		if descendant:IsA("SurfaceGui") then
			local text = descendant:WaitForChild("TextLabel")
			local newSoundId = string.gsub(defaultAudio.SoundId, "rbxassetid://", "")
			text.Text = game:GetService("MarketplaceService"):GetProductInfo(tonumber(newSoundId)).Name
		end
	end)
end