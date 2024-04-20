local MaterialService = game:GetService("MaterialService")
for _, Child in script:GetChildren() do
	Child.Parent = MaterialService
end
