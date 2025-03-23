local tick=tick
local wait=task.wait

local modf=math.modf

local insert=table.insert

local TweenService=game:GetService("TweenService")

local Part=script.Parent
Part.Position = Part.Position

local GoalUp = Part.Position + Vector3.new(0, .15, 0)
local GoalDown = Part.Position - Vector3.new(0, .3, 0)
local TweenInfo = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)

local TweenUp = TweenService:Create(Part, TweenInfo, {Position = GoalUp})
local TweenDown = TweenService:Create(Part, TweenInfo, {Position = GoalDown})

--info about state transitions and transition times is stored here as well as the total duration of the animation
local TotalTime=0
local StateTimes={}
local StateTransitions={}

local function InsertStateTransition(Duration,TransitionFunc)
	insert(StateTimes,TotalTime)
	insert(StateTransitions,TransitionFunc)
	TotalTime+=Duration
end

InsertStateTransition(2,function()
	TweenUp:Play()
end)
InsertStateTransition(2,function()
	TweenDown:Play()
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
