function onTouched(hit)
	if hit.Parent:findFirstChild("Humanoid") then
		hit.Parent.Humanoid:TakeDamage(0)
	end
end

script.Parent.Touched:connect(onTouched)

while true do
	for i = 1,25 do
		for _,v in pairs(script.Parent:GetChildren()) do
			if v:IsA("Texture") then
				v.Texture = string.format("rbxasset://textures/water/normal_%02d.dds",i)
			end
		end
		wait()
	end
end