local materials = {Enum.Material.SmoothPlastic, Enum.Material.Neon}
local currentIndex = 1

for _,part in script.Parent:GetChildren() do
	if part:IsA("BasePart") then
		while true do
			-- Toggle material
			part.Material = materials[currentIndex]

			-- Switch index between 1 and 2
			currentIndex = 3 - currentIndex

			wait(3)  -- wait 3 seconds
		end
	end
end