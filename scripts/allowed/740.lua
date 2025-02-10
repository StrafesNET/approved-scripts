local tick=tick
local wait=task.wait

local modf=math.modf

local insert=table.insert

local Part=script.Parent
local One=Part.One
local Two=Part.Two
local Three=Part.Three
local Four=Part.Four
local Five=Part.Five
local Six=Part.Six
local Seven=Part.Seven

local Plastic=Enum.Material.Plastic
local Neon=Enum.Material.Neon

--info about state transitions and transition times is stored here as well as the total duration of the animation
local TotalTime=0
local StateTimes={}
local StateTransitions={}

local function InsertStateTransition(Duration,TransitionFunc)
	insert(StateTimes,TotalTime)
	insert(StateTransitions,TransitionFunc)
	TotalTime+=Duration
end

InsertStateTransition(0.2,function()
	One.Material=Plastic
	Two.Material=Plastic
	Three.Material=Plastic
	Four.Material=Plastic
	Five.Material=Plastic
	Six.Material=Plastic
	Seven.Material=Plastic
end)
InsertStateTransition(0.2,function()
	One.Material=Neon
end)
InsertStateTransition(0.2,function()
	Two.Material=Neon
end)
InsertStateTransition(0.2,function()
	Three.Material=Neon
end)
InsertStateTransition(0.2,function()
	Four.Material=Neon
end)
InsertStateTransition(0.2,function()
	Five.Material=Neon
end)
InsertStateTransition(0.2,function()
	Six.Material=Neon
end)
InsertStateTransition(1,function()
	Seven.Material=Neon
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
