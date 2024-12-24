local l = game:GetService("Lighting")

l.ClockTime = "0"

for _,effect in script:GetChildren() do
	effect.Parent = l
end
