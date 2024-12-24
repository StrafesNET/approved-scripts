local tick=tick
local wait=task.wait

local modf=math.modf

local insert=table.insert

local Light=script.Parent
local LightLight=Light.Parent
local Flicker=LightLight.Flicker
local SpotLight=Light.SpotLight
--local ParticleEmitter=LightLight.Sparks.ParticleEmitter

local Neon=Enum.Material.Neon
local SmoothPlastic=Enum.Material.SmoothPlastic
local White=BrickColor.White()
local Black=BrickColor.Black()

--info about state transitions and transition times is stored here as well as the total duration of the animation
local TotalTime=0
local StateTimes={}
local StateTransitions={}

local function InsertStateTransition(Duration,TransitionFunc)
	insert(StateTimes,TotalTime)
	insert(StateTransitions,TransitionFunc)
	TotalTime+=Duration
end

InsertStateTransition(3,function()
	Flicker.Material = SmoothPlastic
	Flicker.BrickColor = Black
	SpotLight.Enabled = false
	-- ParticleEmitter.Enabled = false
end)
InsertStateTransition(.6,function()
	Flicker.Material = Neon
	Flicker.BrickColor = White
	SpotLight.Enabled = true
	-- ParticleEmitter.Enabled = true
end)
InsertStateTransition(.2,function()
	Flicker.Material = SmoothPlastic
	Flicker.BrickColor = Black
	SpotLight.Enabled = false
	-- ParticleEmitter.Enabled = false
end)
InsertStateTransition(.2,function()
	Flicker.Material = Neon
	Flicker.BrickColor = White
	SpotLight.Enabled = true
	-- ParticleEmitter.Enabled = true
end)
InsertStateTransition(.2,function()
	Flicker.Material = SmoothPlastic
	Flicker.BrickColor = Black
	SpotLight.Enabled = false
	-- ParticleEmitter.Enabled = false
end)
InsertStateTransition(.1,function()
	Flicker.Material = Neon
	Flicker.BrickColor = White
	SpotLight.Enabled = true
	-- ParticleEmitter.Enabled = true
end)
InsertStateTransition(2,function()
	Flicker.Material = SmoothPlastic
	Flicker.BrickColor = Black
	SpotLight.Enabled = false
	-- ParticleEmitter.Enabled = false
end)
InsertStateTransition(.6,function()
	Flicker.Material = Neon
	Flicker.BrickColor = White
	SpotLight.Enabled = true
	-- ParticleEmitter.Enabled = true
end)
InsertStateTransition(5,function()
	Flicker.Material = SmoothPlastic
	Flicker.BrickColor = Black
	SpotLight.Enabled = false
	-- ParticleEmitter.Enabled = false
end)
InsertStateTransition(.2,function()
	Flicker.Material = Neon
	Flicker.BrickColor = White
	SpotLight.Enabled = true
	-- ParticleEmitter.Enabled = true
end)
InsertStateTransition(.2,function()
	Flicker.Material = SmoothPlastic
	Flicker.BrickColor = Black
	SpotLight.Enabled = false
	-- ParticleEmitter.Enabled = false
end)
InsertStateTransition(.1,function()
	Flicker.Material = Neon
	Flicker.BrickColor = White
	SpotLight.Enabled = true
	-- ParticleEmitter.Enabled = true
end)
--make sure an extra time slot is populated so no errors occur
insert(StateTimes,TotalTime)

--main loop
local Iteration=nil
local NextState=1
local t0=tick()
while true do
	--split floating point number into its integer and fractional part
	local IterationCount,t=modf((tick()-t0)/TotalTime)
	t*=TotalTime

	--if a loop boundary is crossed, reset the state to the beginning of the animation
	if Iteration~=IterationCount then
		Iteration=IterationCount
		NextState=1
	end

	--run steps of the animation that happened since the last frame (usually none)
	while StateTimes[NextState]<t do
		StateTransitions[NextState]()
		NextState+=1
	end

	--approximately wait a certain amount of time using roblox's inaccurate scheduling system
	--the times will adjust and self-correct depending on the actual time waited
	wait(StateTimes[NextState]-t)
end
