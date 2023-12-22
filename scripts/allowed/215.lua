workspace.Terrain.WaterColor=Color3.fromRGB(20, 45, 70)
for _,v in script.Parent:GetChildren() do
	if v:IsA('BasePart') and v.Name:find('water_pure01') then
		workspace.Terrain:FillBlock(v.CFrame,v.Size,Enum.Material.Water)
		v:Destroy()
	end
end
script:Destroy()