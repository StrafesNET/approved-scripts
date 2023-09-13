script.Parent = workspace
local fogScript = script:WaitForChild("PlayerScript")
local AudioPlayer = fogScript:FindFirstChildWhichIsA("Sound")
local mapName = fogScript.MapName.Value
local mapModel = workspace:WaitForChild(mapName)

local connection

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

workspace.ChildRemoved:Connect(function(instance)
    if instance == mapModel then
        print("Map deleted, destroying ServerScript")
		connection:Disconnect()
        script:Destroy()
    end
end)