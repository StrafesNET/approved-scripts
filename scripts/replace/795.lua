local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- i love you aidan9382 --moomanchicken

local plr = game.Players.LocalPlayer
repeat wait() until plr.Character
local chr = plr.Character
local bhop_rpg = script.Parent
local regions = bhop_rpg:WaitForChild("Regions")

local hum = chr:WaitForChild("Humanoid")
local mouse = plr:GetMouse()	
local cam = workspace.CurrentCamera

local npcs = {
	["Wizard1"] = {
		["Waiting"] = false,
		["Part"] = regions:WaitForChild("Region1"):WaitForChild("Wizard1")
	},
	["Satyr1"] = {
		["Waiting"] = false,
		["Part"] = regions:WaitForChild("Region3"):WaitForChild("Satyr1")
	},
	["Knight1"] = {
		["Waiting"] = false,
		["Part"] = regions:WaitForChild("Region13"):WaitForChild("Knight1")
	}
}


-- initialize proximity prompts
for npcName, npcInfo in pairs(npcs) do
	if npcInfo["Part"] then
		local proximityPrompt = Instance.new("ProximityPrompt")
		proximityPrompt.MaxActivationDistance = 25
		proximityPrompt.Style = "Custom"
		proximityPrompt.ActionText = "Talk"
		proximityPrompt.Parent = npcInfo["Part"]

		proximityPrompt.Triggered:Connect(function(player)
			interact(npcs[npcName])
			print("Interaction by ".. player.Name)
		end)
	else
		warn("NPC ".. npcName.. "was not found")
	end
end

-- make textbox go up
function interact(npc)

	if npc and not npc.Waiting then
		local distance = plr:DistanceFromCharacter(npc.Part.Textbox.Position)
		if distance < 35 then
			npc.Waiting = true
			local part = npc.Part.Textbox
			local originalPosition = part.Position
			local upPosition = originalPosition + Vector3.new(0, 15, 0)
			
			local tweenInfo = TweenInfo.new(
				5,                       
				Enum.EasingStyle.Sine,    
				Enum.EasingDirection.InOut, 
				0,                       
				false,                     
				0                         
			)
			local tweenUp = TweenService:Create(part, tweenInfo, { Position = upPosition })
			tweenUp:Play()
			tweenUp.Completed:Wait()
			wait(7)
			local tweenInfo = TweenInfo.new(
				5,                       
				Enum.EasingStyle.Sine,    
				Enum.EasingDirection.InOut, 
				0,                       
				false,                     
				0                         
			)
			local tweenDown = TweenService:Create(part, tweenInfo, { Position = originalPosition })
			tweenDown:Play()
			tweenDown.Completed:Wait()
			npc.Waiting = false
		end
		
	end
end
