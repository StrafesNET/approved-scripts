local height = 40
local gravity = 100
local velocity = Vector3.new(0, math.sqrt(2 * gravity * height), 0)
for _, part in script.Parent:GetChildren() do
	if part:IsA("BasePart") then
		part.Velocity = velocity
	end
end