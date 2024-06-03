script.Parent = workspace
local fogScript = script:WaitForChild("PlayerScript")
local mapName = fogScript.MapName.Value
local mapModel = workspace:WaitForChild(mapName)

local connection

local function onPlayerAdded(player)
	player.CharacterAdded:connect(function(char)
		if not player.Backpack:FindFirstChild("PlayerScript") then
			if not workspace:FindFirstChild(mapName) then
				connection:Disconnect()
				script:Destroy()
			else
				fogScript:Clone().Parent = player.Backpack
			end
		end
	end) 
end

connection = game:GetService("Players").PlayerAdded:connect(onPlayerAdded)

for _, player in pairs(game.Players:GetPlayers()) do
	fogScript:Clone().Parent = player.Backpack
	player.CharacterAdded:connect(function(char)
		if not player.Backpack:FindFirstChild("PlayerScript") then
			if not workspace:FindFirstChild(mapName) then
				connection:Disconnect()
				script:Destroy()
			else
				fogScript:Clone().Parent = player.Backpack
			end
		end
	end)
end

workspace.ChildRemoved:Connect(function(instance)
    if instance == mapModel then
		connection:Disconnect()
        script:Destroy()
    end
end)