local RunService = game:GetService("RunService")

local tesla = script.Parent
local light = tesla:WaitForChild("Lightning")
local emitter = tesla:WaitForChild("ParticleEmitter")

local curTime = 0
local lightTimer = 0

local function getNextTime()
	return math.random(-10, 10) * 0.02 + 1.5
end

local timeUntilNext = getNextTime()

local function onStep(dt)
	curTime = curTime + dt
	lightTimer = lightTimer + dt
	
	if curTime > timeUntilNext then
		curTime = curTime - timeUntilNext
		timeUntilNext = getNextTime()
		lightTimer = 0
		emitter:Emit(3)
	end
	
	light.Enabled = lightTimer < 0.3
end

RunService.Heartbeat:Connect(onStep)