local part = script.Parent.Part
local lastpartcf = part.CFrame
for i = 0, 1, 0.01 do
	local clone = part:Clone()
	clone.Parent = script.Parent
	clone.CFrame = lastpartcf * CFrame.new(0, clone.Size.Y, 0)
	lastpartcf = clone.CFrame
	clone.Transparency = i
	for i2,v in pairs(clone:GetChildren()) do
		if v:IsA("Texture") then
			v.Transparency = i
		end
	end
end