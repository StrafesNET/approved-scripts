local Lighting=game:GetService'Lighting'
Lighting.TimeOfDay="07:00:00"
for _,v in script:GetChildren() do
	v.Parent=Lighting
end
