-- Fix humanoid collisions not disabling (by aidan9382)
-- Yes, humanoid logic is so dumb I am forced to run this on both the server and client side. Go figure

local Torsos = {}
for _, Character in script.Parent:GetChildren() do
	if Character.ClassName == "Model" then
		Character.Humanoid.DisplayName = " " -- Ensure the name is hidden
		Character.Humanoid.EvaluateStateMachine = false -- Discourage collisions re-enabling
		for _, Part in Character:GetDescendants() do
			if Part:IsA("BasePart") then
				Part.CanCollide = false -- Guarantee the collision is off
				Part.CanQuery = false -- FPS improver
			end
		end
		-- R6
		Torsos[#Torsos+1] = Character:FindFirstChild("Torso")
		-- R15
		Torsos[#Torsos+1] = Character:FindFirstChild("UpperTorso")
		Torsos[#Torsos+1] = Character:FindFirstChild("LowerTorso")
	end
end

-- Fix torso collision re-enabling itself because WHY
game:GetService("RunService").PreSimulation:Connect(function()
	for _, Torso in Torsos do
		Torso.CanCollide = false
	end
end)
