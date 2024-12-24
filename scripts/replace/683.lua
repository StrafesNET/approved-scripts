-- Disco floor manager (by aidan9382)
-- Because having 1 script per floor instead of 1 script per piece sounds nicer
local discoPieces = script.Parent:WaitForChild("Disco Pieces")
local FlashingParts = {}

task.wait(2)
for _, piece in pairs(discoPieces:GetChildren()) do
	table.insert(FlashingParts, piece)
end

while task.wait(0.35) do
	for _, part in FlashingParts do
		part.BrickColor = BrickColor.random()
	end
end