local tick=tick
local wait=task.wait

local modf=math.modf

local insert=table.insert

local TweenService=game:GetService("TweenService")

local Hinge=script.Parent.Lid.Hinge

local ClosedCFrame=Hinge.CFrame

local OpenTarget={CFrame=ClosedCFrame*CFrame.fromEulerAnglesXYZ(0,-math.pi/2,0)}
local OpenTween=TweenInfo.new(48/30,Enum.EasingStyle.Linear)
local CloseTarget={CFrame=ClosedCFrame}
local CloseTween=TweenInfo.new(48/30,Enum.EasingStyle.Linear)

--info about state transitions and transition times is stored here as well as the total duration of the animation
local TotalTime=0
local StateTimes={}
local StateTransitions={}

local function InsertStateTransition(Duration,TransitionFunc)
	insert(StateTimes,TotalTime)
	insert(StateTransitions,TransitionFunc)
	TotalTime+=Duration
end

--reset state and then do nothing for 0.1s
InsertStateTransition(0.1,function()
	Hinge.CFrame=ClosedCFrame
end)
--open chest, hold for 10s
InsertStateTransition(10+48/30,function()
	TweenService:Create(Hinge,OpenTween,OpenTarget):Play()
end)
--close chest, hold for 90s (the original script says 45s but it is bugged, and we recreate the exact behaviour)
InsertStateTransition(45*2+48/30,function()
	TweenService:Create(Hinge,CloseTween,CloseTarget):Play()
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
