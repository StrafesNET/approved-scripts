--Parts inside this folder will be turned invisible
--Useful for invisible triggers and other invisible parts that you want
--to see in studio but not in-game.
for _, i in script.Parent:GetDescendants() do
	if i:IsA("BasePart") then
		i.Transparency = 1
	end
end