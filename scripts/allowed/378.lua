local tick=tick

local modf=math.modf

local insert=table.insert

local TotalTime=0
local StateTimes={}
local StateTransitions={}

local function InsertStateTransition(Duration,TransitionFunc)
	insert(StateTimes,TotalTime)
	insert(StateTransitions,TransitionFunc)
	TotalTime+=Duration
end

local p1 = script.Parent.p1
local p2 = script.Parent.p2
local p3 = script.Parent.p3

--reset, hold for 0.2s
InsertStateTransition(0.2,function()
	p3.Transparency = 0
	p2.Transparency = 0
	p1.Transparency = 0
end)
--turn off, hold for 0.2s
InsertStateTransition(0.2,function()
	p3.Transparency = 1
	p2.Transparency = 1
	p1.Transparency = 1
end)
--turn on, hold for 1s
InsertStateTransition(1,function()
	p3.Transparency = 0
	p2.Transparency = 0
	p1.Transparency = 0
end)
InsertStateTransition(0.2,function()
	p3.Transparency = 1
end)
InsertStateTransition(0.2,function()
	p2.Transparency = 1
end)
InsertStateTransition(1,function()
	p1.Transparency = 1
end)
InsertStateTransition(0.2,function()
	p3.Transparency = 0
end)
InsertStateTransition(0.2,function()
	p2.Transparency = 0
end)
InsertStateTransition(1,function()
	p1.Transparency = 0
end)
InsertStateTransition(0.2,function()
	p3.Transparency = 1
end)
InsertStateTransition(0.2,function()
	p2.Transparency = 1
end)
InsertStateTransition(1,function()
	p1.Transparency = 1
end)

--make sure an extra time slot is populated so no errors occur
insert(StateTimes,TotalTime)

local Iteration=nil
local NextState=1
local t0=tick()
game:GetService'RunService'.Heartbeat:connect(function()
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
end)