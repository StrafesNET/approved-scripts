local fogScript = script:FindFirstChild("FogYes") or script:WaitForChild("FogYes")

game.Players.PlayerAdded:connect(function(player)
	player.CharacterAdded:connect(function(char)
		if not player.Backpack:FindFirstChild("FogYes") then
			fogScript:Clone().Parent = player.Backpack
		end
	end) 
end)

for _, player in pairs(game.Players:GetPlayers()) do
	if not player.Backpack:FindFirstChild("FogYes") then
		fogScript:Clone().Parent = player.Backpack
	end
end