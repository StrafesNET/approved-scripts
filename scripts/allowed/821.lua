local texts = {}
for _,text in script.Parent:GetDescendants() do
	if text:IsA("TextLabel") then
		table.insert(texts, {
			label=text,
			pos_x_scale=text.Position.X.Scale,
		})
	end
end

local tick=tick
local speed = 0.005*30
local t0=tick()

game:GetService'RunService'.Heartbeat:Connect(function(dt)
	local offset=(tick()-t0)*speed
	for _,text in texts do
		local offset_x = text.pos_x_scale - offset
		text.label.Position = UDim2.new((offset_x + 1)%2 - 1, 0, 0, 0)
	end
end)
