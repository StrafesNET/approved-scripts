script.Parent = workspace

local mapName = "bhop_emblem_6"
local mapModel = workspace:WaitForChild(mapName)

--map lighting
local lighting = game.Lighting

lighting.Ambient = Color3.fromRGB(175, 175, 175)
lighting.Brightness = 0
lighting.GlobalShadows = false
lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
lighting.ClockTime = 14

--fiveman client side code stuff things
local randomColorsScript = script:WaitForChild("Random Colors")
local connection

local function onPlayerAdded(player)
	player.CharacterAdded:connect(function(char)
		--print('Player Added')
		if not player.Backpack:FindFirstChild("Random Colors") then
			--print('Localscript not found in player\'s inventory')
			if not workspace:FindFirstChild(mapName) then
				--print('Map not found, deleting connection')
				connection:Disconnect()
				script:Destroy()
			else
				--print(workspace:FindFirstChild(mapName))
				randomColorsScript:Clone().Parent = player.Backpack
				--print('Localscript added to player')
			end
		end
	end) 
end

connection = game:GetService("Players").PlayerAdded:connect(onPlayerAdded)

for _, player in pairs(game.Players:GetPlayers()) do
	--print('Checking player')
	--('Localscript added to player')
	randomColorsScript:Clone().Parent = player.Backpack
	onPlayerAdded(player)
end

workspace.ChildRemoved:Connect(function(instance)
	if instance == mapModel then
		--print("Map deleted, destroying ServerScript")
		connection:Disconnect()
		script:Destroy()
	end
end)