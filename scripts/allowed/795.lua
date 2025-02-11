local TweenService = game:GetService("TweenService")

-- i love you aidan9382 --moomanchicken

local plr = game:GetService'Players'.LocalPlayer
local bhop_rpg = script.Parent
local regions = bhop_rpg:WaitForChild("Regions")

local function MakeNPC(NPCPart)
	local Textbox = NPCPart.Textbox
	local originalPosition = Textbox.Position
	local upPosition = originalPosition + Vector3.new(0, 15, 0)

	return {
		Waiting = false,
		Part = NPCPart,
		Textbox = Textbox,
		UpTarget = { Position = upPosition },
		DownTarget = { Position = originalPosition },
	}
end

local npcs = {
	Wizard1 = MakeNPC(regions:WaitForChild("Region1"):WaitForChild("Wizard1")),
	Satyr1 = MakeNPC(regions:WaitForChild("Region3"):WaitForChild("Satyr1")),
	Knight1 = MakeNPC(regions:WaitForChild("Region13"):WaitForChild("Knight1")),
}

local tweenInfo = TweenInfo.new(5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)

-- make textbox go up
local function interact(npc)
	if not plr.Character then return end

	if npc.Waiting then return end

	local Textbox = npc.Textbox
	local distance = plr:DistanceFromCharacter(Textbox.Position)
	if 35 < distance then return end

	npc.Waiting = true

	local tweenUp = TweenService:Create(Textbox, tweenInfo, npc.UpTarget)
	tweenUp:Play()
	tweenUp.Completed:Wait()

	task.wait(7)

	local tweenDown = TweenService:Create(Textbox, tweenInfo, npc.DownTarget)
	tweenDown:Play()
	tweenDown.Completed:Wait()

	npc.Waiting = false
end

-- initialize proximity prompts
for npcName, npcInfo in npcs do
	local proximityPrompt = Instance.new("ProximityPrompt")
	proximityPrompt.MaxActivationDistance = 25
	proximityPrompt.Style = "Custom"
	proximityPrompt.ActionText = "Talk"
	proximityPrompt.Parent = npcInfo.Part

	proximityPrompt.Triggered:Connect(function(player)
		print("Interaction by ".. player.Name)
		interact(npcInfo)
	end)
end
