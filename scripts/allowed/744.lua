local l = game:GetService'Lighting'
l.TimeOfDay = 5
for _,effect in script:GetChildren() do
	effect.Parent = l
end
