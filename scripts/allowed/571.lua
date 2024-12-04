local tick=tick
local wait=task.wait

local Part=script.Parent
local Decal=Part.Decal

local BaseSize=Vector3.new(1,1,1)
local StepSize=Vector3.new(1,0,1)

local StepTime=0.4
local MaximumSteps=14

--main loop
local Step=0
local t0=tick()
while true do
	local t=tick()-t0

	local WrappedStep=Step%MaximumSteps
	Part.Size=BaseSize+StepSize*WrappedStep
	Decal.Transparency=WrappedStep/13

	--approximately wait a certain amount of time using roblox's inaccurate scheduling system
	--the times will adjust and self-correct depending on the actual time waited
	Step+=1
	wait(Step*StepTime-t)
end
