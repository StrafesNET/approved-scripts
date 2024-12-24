local tick=tick
local wait=task.wait

local modf=math.modf

local insert=table.insert

local TweenService=game:GetService("TweenService")

local Part=script.Parent

local BaseCFrame=Part.CFrame

local OpenTarget={CFrame=BaseCFrame*CFrame.new(0,-0.05,0)}
local OpenTween=TweenInfo.new(1/3,Enum.EasingStyle.Linear)
local CloseTarget={CFrame=BaseCFrame}
local CloseTween=TweenInfo.new(1/3,Enum.EasingStyle.Linear)

--info about state transitions and transition times is stored here as well as the total duration of the animation
local TotalTime=0
local StateTimes={}
local StateTransitions={}

local function InsertStateTransition(Duration,TransitionFunc)
	insert(StateTimes,TotalTime)
	insert(StateTransitions,TransitionFunc)
	TotalTime+=Duration
end

--reset state and then tween
InsertStateTransition(1/3,function()
	Part.CFrame=BaseCFrame
	TweenService:Create(Part,OpenTween,OpenTarget):Play()
end)
InsertStateTransition(1/3,function()
	TweenService:Create(Part,CloseTween,CloseTarget):Play()
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
