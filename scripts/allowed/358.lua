local tick = tick
local part = script.Parent
local pos = part.Position
local origin = Vector3.new(pos.x, pos.y-0.2, pos.z)
local x = 0
local z = 0
local T = -99999
local tall = part.Size.Y / 2
local rate = 0.12*30
game:GetService'RunService'.Heartbeat:Connect(function()
	local T = tick() * rate
	local offset = origin + Vector3.new(
		(math.sin(T + (origin.x/5)) * math.sin(T/9))/3,
		0,
		(math.sin(T + (origin.z/6)) * math.sin(T/12))/4
	)
	part.CFrame = CFrame.Angles((z-origin.z)/tall, 0, (x-origin.x)/-tall) + offset
end)
