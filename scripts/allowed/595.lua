local part = script.Parent.Part
local PartHeight = part.Size.Y
local BaseCFrame = part.CFrame
for i = 1,100 do
	local t = i/100
	local clone = part:Clone()
	clone.Parent = script.Parent
	clone.CFrame = BaseCFrame * CFrame.new(0, i*PartHeight, 0)
	clone.Transparency = t
	for _,v in clone:GetChildren() do
		if v:IsA("Texture") then
			v.Transparency = t
		end
	end
end
