-- Pryotechnics thing
-- Blame aidan9382 if it doesn't work
-- these 3 WERE going to be automatically detected, but roblox is an amazing platform that definitely works
local stands = 2
local columns = 6
local fires = 24
local fireActiveTime = 5 -- amount of time between finishing activing and starting to deactivate
local activatingPart = script.Parent.Parent:WaitForChild'Folder':WaitForChild'MapFinish' -- name of the part that triggers the effects

local Params=OverlapParams.new()
Params.FilterDescendantsInstances = {activatingPart}
Params.FilterType = Enum.RaycastFilterType.Include

-- The below is real code, touch only if you know what you're doing
local model = script.Parent

local cache={}
local align_stand=columns*fires
local align_column=fires
local function get_stand_flame_fire(stand,column,fire)
	local fire_id=stand*align_stand+column*align_column+fire
	local Fire=cache[fire_id]
	if not Fire then
		Fire=model["Stand"..stand]["Flame"..column]["Fire"..fire].Fire
		cache[fire_id]=Fire
	end
	return Fire
end

local function SetFireActive(active)
	for column = 1, columns do
		for fire = 1, fires do
			for stand = 1, stands do
				get_stand_flame_fire(stand,column,fire).Enabled = active
			end
			task.wait(.03)
		end
		if column ~= columns then
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
game:GetService'RunService'.Heartbeat:Connect(function()
	-- is this really the most optimal way to detect entering a part? idk but it's my first idea so I'm using it
	local parts = workspace:GetPartBoundsInRadius(camera.CFrame.p, 1, Params)
	local foundFinish = false
	for _, part in parts do
		if part == activatingPart then
			foundFinish = true
			break
		end
	end
	if foundFinish ~= insideFinish then
		insideFinish = foundFinish
		if insideFinish then
			task.spawn(DoPyrotechnics) -- We don't have to spawn() this, but since it waits, safer to spawn
		end
	end
end)
