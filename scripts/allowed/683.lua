-- Disco floor manager (by aidan9382)
-- Because having 1 script per floor instead of 1 script per piece sounds nicer
local discoPieces = script.Parent:WaitForChild("Disco Pieces")

local FlashingParts = {}
local function AddDiscoPart(part)
	table.insert(FlashingParts, part)
end
for _, part in discoPieces:GetChildren() do
	AddDiscoPart(part)
end
discoPieces.ChildAdded:Connect(AddDiscoPart)

local tick=tick
local wait=task.wait

local StepTime=0.35

--main loop
local Step=0
local t0=tick()
while true do
	local t=tick()-t0

	for _, part in FlashingParts do
		part.BrickColor = BrickColor.random()
	end

	--approximately wait a certain amount of time using roblox's inaccurate scheduling system
	--the times will adjust and self-correct depending on the actual time waited
	Step+=1
	wait(Step*StepTime-t)
end
