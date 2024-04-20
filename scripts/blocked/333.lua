--print('MusicZones localscript start')

local tweenService = game:GetService("TweenService")
local mapName = script:WaitForChild("MapName").Value
local mapModel = workspace:WaitForChild(mapName)
local player = script.Parent.Parent
local defaultAudio = script:FindFirstChildWhichIsA("Sound")

local mute = false
local originalVolume
for _, button in pairs(mapModel.MusicZones.MuteButtons:GetChildren()) do
	button.Mute:FindFirstChild("ClickDetector").MouseClick:Connect(function()
		local soundInBackpack = player.Backpack:FindFirstChildWhichIsA("Sound")
		if not mute then
			mute = true
			originalVolume = soundInBackpack.Volume
			soundInBackpack.Volume = 0
			for _, v in pairs(mapModel.MusicZones.MuteButtons:GetChildren()) do
				v:FindFirstChild("Mute").Color = Color3.fromRGB(170, 100, 100)
				v:FindFirstChild("Mute").Decal.Texture = "rbxassetid://1066885247"
			end
		elseif mute then
			mute = false
			soundInBackpack.Volume = originalVolume
			for _, v in pairs(mapModel.MusicZones.MuteButtons:GetChildren()) do
				v:FindFirstChild("Mute").Color = Color3.fromRGB(152, 184, 109)
				v:FindFirstChild("Mute").Decal.Texture = "rbxassetid://1066885395"
			end
		end
	end)
end

workspace.ChildRemoved:Connect(function(instance)
	if instance == mapModel then
		--print("Map deleted, destroying PlayerScript + AudioPlayer")
		-- Without destroying the audio, the music set by other maps will get overridden by this script
		player.Backpack:FindFirstChildWhichIsA("Sound"):Destroy()
		script:Destroy()
	end
end)

local function search(value, name) 
	if value.Name == name then
		return value
	end
end

local debounce = false
local function changeAudio(audio)
	local soundInBackpack = player.Backpack:FindFirstChildWhichIsA("Sound")
	if soundInBackpack then
		local soundBpId = search(soundInBackpack, soundInBackpack.Name).SoundId
		if audio.SoundId ~= soundBpId and not mute and not debounce then
			debounce = true
			local tweenLength = 1
			local values = {}
			values.Volume = 0
			local tweenInfo = TweenInfo.new(tweenLength)
			local tween = tweenService:Create(soundInBackpack, tweenInfo, values)
			tween:Play()
			wait(tweenLength)
			for _, v in pairs(player.Backpack:GetChildren()) do
				if v:IsA("Sound") then
					v:Destroy()
				end
			end
			if not player.Backpack:FindFirstChildWhichIsA("Sound") then
				local clonedAudio = audio:Clone()
				local soundObjects = 0
				local soundId = clonedAudio.SoundId
				local newSoundId = string.gsub(soundId, "rbxassetid://", "")
				for _, v in pairs(mapModel.MusicZones.MuteButtons:GetDescendants()) do
					if v:IsA("BasePart") and v.Name == "AudioName" then
						if v:FindFirstChild("SurfaceGui") then
							v.SurfaceGui:FindFirstChild("TextLabel").Text = game:GetService("MarketplaceService"):GetProductInfo(tonumber(newSoundId)).Name
						end
					end
				end
				local ogVolume = clonedAudio.Volume
				clonedAudio.Volume = 0
				clonedAudio.Parent = player.Backpack
				clonedAudio:Play()
				for _, s in pairs(player.Backpack:GetChildren()) do
					if s:IsA("Sound") then
						soundObjects = soundObjects + 1
					end
				end
				if soundObjects > 1 then
					for count = soundObjects, 1, -1 do
						print(player.Backpack:FindFirstChildWhichIsA("Sound").Name)
						player.Backpack:FindFirstChildWhichIsA("Sound"):Destroy()
					end
				end
				local values2 = {}
				values2.Volume = ogVolume
				local tweenInfo2 = TweenInfo.new(tweenLength)
				local tween2 = tweenService:Create(clonedAudio, tweenInfo2, values2)
				tween2:Play()
				wait(tweenLength)
				debounce = false
			end
		elseif audio.SoundId ~= soundBpId and mute then
			for _, v in pairs(player.Backpack:GetChildren()) do
				if v:IsA("Sound") then
					v:Destroy()
				end
			end
			if not player.Backpack:FindFirstChildWhichIsA("Sound") then
				local clonedAudio = audio:Clone()
				clonedAudio.Parent = player.Backpack
				originalVolume = clonedAudio.Volume
				clonedAudio.Volume = 0
				clonedAudio:Play()
				local soundId = clonedAudio.SoundId
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
	elseif not soundInBackpack then
		local clonedAudio = audio:Clone()
		clonedAudio.Parent = player.Backpack
		clonedAudio:Play()
	end
end

local camera = workspace.CurrentCamera
local rayHeight = 500

local isDefaultAudio = true
changeAudio(defaultAudio)

local zones = mapModel:FindFirstChild("MusicZones").Zones

print("MusicZones localscript startup done")

local db = false
game:GetService("RunService").RenderStepped:Connect(function(step)
	-- Update ray and search to see if we are under any parts in MusicZones.Zones
	local ray = Ray.new(camera.CFrame.Position, Vector3.new(rayHeight, 0, 0))
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

for _, v in pairs(mapModel.MusicZones.MuteButtons:GetChildren()) do
	v.AudioName.DescendantAdded:Connect(function(descendant)
		if descendant:IsA("SurfaceGui") then
			local text = descendant:WaitForChild("TextLabel")
			if player.Backpack:FindFirstChildWhichIsA("Sound") then
				local soundInBackpack = player.Backpack:FindFirstChildWhichIsA("Sound")
				local soundId = soundInBackpack.SoundId
				local newSoundId = string.gsub(soundId, "rbxassetid://", "")
				text.Text = game:GetService("MarketplaceService"):GetProductInfo(tonumber(newSoundId)).Name
			end
		end
	end)
end