--tommy
local Root = script.Parent
local Containers = {'Collisions', 'Mechanics', 'Lighting'}

for ContainerIndex = 1, #Containers do
	local Container = Root:FindFirstChild(Containers[ContainerIndex])
	if Container then
		for ChildIndex, Child in Container:GetChildren() do
			if Child:IsA('BasePart') then
				Child.Transparency = 1
			end
		end
	end
end

script:Destroy()