local tick=tick
local wait=task.wait

local modf=math.modf

local insert=table.insert

local TweenService=game:GetService("TweenService")

local Part=script.Parent

local tween=TweenInfo.new(1,Enum.EasingStyle.Linear)
local target1={Color = Color3.fromRGB(255, 0, 0)}
local target2={Color = Color3.fromRGB(255, 155, 0)}
local target3={Color = Color3.fromRGB(255, 255, 0)}
local target4={Color = Color3.fromRGB(0, 255, 0)}
local target5={Color = Color3.fromRGB(0, 255, 255)}
local target6={Color = Color3.fromRGB(0, 155, 255)}
local target7={Color = Color3.fromRGB(255, 0, 255)}
local target8={Color = Color3.fromRGB(255, 0, 155)}

--info about state transitions and transition times is stored here as well as the total duration of the animation
local TotalTime=0
local StateTimes={}
local StateTransitions={}

local function InsertStateTransition(Duration,TransitionFunc)
	insert(StateTimes,TotalTime)
	insert(StateTransitions,TransitionFunc)
	TotalTime+=Duration
end

InsertStateTransition(0.5,function()
	TweenService:Create(Part,tween,target1):Play()
end)
InsertStateTransition(0.5,function()
	TweenService:Create(Part,tween,target2):Play()
end)
InsertStateTransition(0.5,function()
	TweenService:Create(Part,tween,target3):Play()
end)
InsertStateTransition(0.5,function()
	TweenService:Create(Part,tween,target4):Play()
end)
InsertStateTransition(0.5,function()
	TweenService:Create(Part,tween,target5):Play()
end)
InsertStateTransition(0.5,function()
	TweenService:Create(Part,tween,target6):Play()
end)
InsertStateTransition(0.5,function()
	TweenService:Create(Part,tween,target7):Play()
end)
InsertStateTransition(0.5,function()
	TweenService:Create(Part,tween,target8):Play()
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