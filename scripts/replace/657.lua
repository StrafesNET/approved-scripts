-- Pryotechnics thing
-- Blame aidan9382 if it doesn't work
-- these 3 WERE going to be automatically detected, but roblox is an amazing platform that definitely works
local stands = 2
local columns = 6
local fires = 24
local fireActiveTime = 5 -- amount of time between finishing activing and starting to deactivate
local activatingPart = "MapFinish" -- name of the part that triggers the effects

-- The below is real code, touch only if you know what you're doing
local active = false
local model = script.Parent

local function SetFireActive(active)
	for col = 1, columns do
		for i = 1, fires do
			for stand = 1, stands do
				model["Stand"..stand]["Flame"..col]["Fire"..i].Fire.Enabled = active
			end
			task.wait(.03)
		end
		if col ~= columns then
			task.wait(.2)
		end
	end
end

local DoingPyro = false
local function DoPyrotechnics()
	if DoingPyro then
		return
	end
	DoingPyro = true
	SetFireActive(true)
	task.wait(fireActiveTime)
	-- allow re-activating while it is already deactivating
	DoingPyro = false
	SetFireActive(false)
end

local insideFinish = false
local camera = workspace.CurrentCamera
camera:GetPropertyChangedSignal("CFrame"):Connect(function()
	-- is this really the most optimal way to detect entering a part? idk but it's my first idea so I'm using it
	local parts = workspace:GetPartBoundsInRadius(camera.CFrame.p, 1)
	local foundFinish = false
	for _, part in next,parts do
		if part:IsA("Part") and part.Name == activatingPart then
			foundFinish = true
			break
		end
	end
	if foundFinish ~= insideFinish then
		insideFinish = foundFinish
		if insideFinish then
			spawn(DoPyrotechnics) -- We don't have to spawn() this, but since it waits, safer to spawn
		end
	end
end)