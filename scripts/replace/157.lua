local height = 40
local gravity = 100

for _, part in pairs(script.Parent:GetChildren()) do
	if part:IsA("BasePart") then
		part.Velocity = Vector3.new(0, math.sqrt(2 * gravity * height), 0)
	end
end