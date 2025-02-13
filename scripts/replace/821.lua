local texts = {}
for _,i in script.Parent:GetDescendants() do
	if i:IsA("TextLabel") then
		table.insert(texts, i)
	end
end

local speed = 0.005
local fps = 30
local accum = 0
-- i am sorry for not using modulus i am kind of stupid and dont really know how to use it properly
game:GetService'RunService'.Heartbeat:Connect(function(dt)
	accum += dt
	if accum > 1/fps then
		accum = 0
		for _,label in texts do
			label.Position -= UDim2.new(speed, 0, 0,0)
			if label.Position.X.Scale <= -1 then
				label.Position = UDim2.new(1, 0, 0,0)
			end
		end
	end
end)