local tick=tick
local wait=task.wait

local modf=math.modf

local insert=table.insert

local Part=script.Parent
local One=Part.One
local OneOne=Part.OneOne
local Two=Part.Two
local TwoTwo=Part.TwoTwo
local Three=Part.Three
local ThreeThree=Part.ThreeThree
local Four=Part.Four
local FourFour=Part.FourFour
local Five=Part.Five
local FiveFive=Part.FiveFive

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

InsertStateTransition(0.35,function()
	One.Material=Plastic
	Two.Material=Plastic
	Three.Material=Plastic
	Four.Material=Plastic
	Five.Material=Plastic
	OneOne.Material=Plastic
	TwoTwo.Material=Plastic
	ThreeThree.Material=Plastic
	FourFour.Material=Plastic
	FiveFive.Material=Plastic
end)
InsertStateTransition(0.35,function()
	One.Material=Neon
	OneOne.Material=Neon
	Five.Material=Neon
	FiveFive.Material=Neon
end)
InsertStateTransition(0.35,function()
	Two.Material=Neon
	TwoTwo.Material=Neon
	Four.Material=Neon
	FourFour.Material=Neon
end)
InsertStateTransition(0.2,function()
	Three.Material=Neon
	ThreeThree.Material=Neon
end)
InsertStateTransition(0.2,function()
	One.Material=Plastic
	Two.Material=Plastic
	Three.Material=Plastic
	Four.Material=Plastic
	Five.Material=Plastic
	OneOne.Material=Plastic
	TwoTwo.Material=Plastic
	ThreeThree.Material=Plastic
	FourFour.Material=Plastic
	FiveFive.Material=Plastic
end)
InsertStateTransition(0.2,function()
	One.Material=Neon
	Two.Material=Neon
	Three.Material=Neon
	Four.Material=Neon
	Five.Material=Neon
	OneOne.Material=Neon
	TwoTwo.Material=Neon
	ThreeThree.Material=Neon
	FourFour.Material=Neon
	FiveFive.Material=Neon
end)
InsertStateTransition(0.2,function()
	One.Material=Plastic
	Two.Material=Plastic
	Three.Material=Plastic
	Four.Material=Plastic
	Five.Material=Plastic
	OneOne.Material=Plastic
	TwoTwo.Material=Plastic
	ThreeThree.Material=Plastic
	FourFour.Material=Plastic
	FiveFive.Material=Plastic
end)
InsertStateTransition(0.2,function()
	One.Material=Neon
	Two.Material=Neon
	Three.Material=Neon
	Four.Material=Neon
	Five.Material=Neon
	OneOne.Material=Neon
	TwoTwo.Material=Neon
	ThreeThree.Material=Neon
	FourFour.Material=Neon
	FiveFive.Material=Neon
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
