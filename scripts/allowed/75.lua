local Lighting=game:GetService'Lighting'
for _,v in script.Parent.Shaders:GetChildren() do
	v.Parent = Lighting
end