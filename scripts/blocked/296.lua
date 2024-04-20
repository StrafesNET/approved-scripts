script.Parent = workspace
local fogScript = script:WaitForChild("PlayerScript")
local AudioPlayer = fogScript:FindFirstChildWhichIsA("Sound")
local mapName = fogScript.MapName.Value
local mapModel = workspace:WaitForChild(mapName)

--local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local stareEvent = Instance.new("RemoteEvent", ReplicatedStorage)
--stareEvent.Name = "StareEvent"

local connection

for _, v in pairs(mapModel.MusicZones.Zones:GetChildren()) do
	if v:IsA("BasePart") then
		v.Transparency = 1
	end
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(function(char)
		print('Player Added')
		if not player.Backpack:FindFirstChild("PlayerScript")then
			print('Localscript not found in player\'s inventory')
			if not workspace:FindFirstChild(mapName) then
				print('Map not found, deleting connection')
				connection:Disconnect()
				script:Destroy()
			else
				print(workspace:FindFirstChild(mapName))
				fogScript:Clone().Parent = player.Backpack
				print('Localscript added to player')
			end
		end
	end) 
end

connection = game:GetService("Players").PlayerAdded:Connect(onPlayerAdded)

for _, player in pairs(game.Players:GetPlayers()) do
	print('Checking player')
	print('Localscript added to player')
	fogScript:Clone().Parent = player.Backpack
	player.CharacterAdded:Connect(function(char)
		print('Player Added')
		if not player.Backpack:FindFirstChild("PlayerScript") then
			print('Localscript not found in player\'s inventory')
			if not workspace:FindFirstChild(mapName) then
				print('Map not found, deleting connection')
				connection:Disconnect()
				script:Destroy()
			else
				print(workspace:FindFirstChild(mapName))
				fogScript:Clone().Parent = player.Backpack
				print('Localscript added to player')
			end
		end
	end)
end

--local sFolder = mapModel.Stares
--stareEvent.OnServerEvent:Connect(function(part, isScreenOn)
--	if isScreenOn then
--		sFolder.Parts["Trigger"..part.Name].CFrame = sFolder.Parts["Location"..part.Name].CFrame
--	else
--		sFolder.Parts["Trigger"..part.Name].CFrame = sFolder.Parts["Trigger"..part.Name]:FindFirstChild("originalCFrame").Value
--	end
--end)

workspace.ChildRemoved:Connect(function(instance)
	if instance == mapModel then
		print("Map deleted, destroying ServerScript")
		connection:Disconnect()
		script:Destroy()
	end
end)

wait(5)
print("Running code below")
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