local tick=tick
local wait=task.wait

local modf=math.modf

local insert=table.insert

local Part=script.Parent

local BaseSize=Part.Size
local Size1=Part.Size+Vector3.new(1,0,1)
local Size2=Part.Size+Vector3.new(2,0,2)
local Size3=Part.Size+Vector3.new(3,0,3)

--info about state transitions and transition times is stored here as well as the total duration of the animation
local TotalTime=0
local StateTimes={}
local StateTransitions={}

local function InsertStateTransition(Duration,TransitionFunc)
	insert(StateTimes,TotalTime)
	insert(StateTransitions,TransitionFunc)
	TotalTime+=Duration
end

--state transition every 0.2s
InsertStateTransition(0.2,function()
	Part.Size=BaseSize
end)
InsertStateTransition(0.2,function()
	Part.Size=Size1
end)
InsertStateTransition(0.2,function()
	Part.Size=Size2
end)
InsertStateTransition(0.2,function()
	Part.Size=Size3
end)
InsertStateTransition(0.2,function()
	Part.Size=Size2
end)
InsertStateTransition(0.2,function()
	Part.Size=Size1
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
