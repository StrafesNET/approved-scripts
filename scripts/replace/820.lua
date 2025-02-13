local rainbowParts = game:GetService("CollectionService"):GetTagged("Rainbow")

local tick=tick
local HSV=Color3.fromHSV
local speed=1/(256*6)*30

game:GetService'RunService'.Heartbeat:Connect(function()
	for _,rainbow in rainbowParts do
		if rainbow:IsA("SurfaceLight") then
			rainbow.Color=HSV(speed*tick()%1,1,1)
			continue end
		rainbow.Color3=HSV(speed*tick()%1,1,1)		
	end
end)