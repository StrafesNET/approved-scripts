--edited by lf, script from noob
--How to use:
--[[
	The 'materials' library is all the terrain materials this script supports.
	['Rock']=Enum.Material.Rock means when you name a part 'Rock', Rock terrain will
	be generated on the part. Hence the same with all the other materials.

	deletePartsOnGeneration means when the terrain fills the block it will delete the
	part when set to true and do nothing when set to false.

	For this script to work, you'll need to place this script inside of you map model.
--]]
local terrain=workspace.Terrain
local materials={
	['Sand']=Enum.Material.Sand
}

for _,v in script.Parent:GetChildren() do
	if v:IsA("BasePart") then
		local enum=materials[v.Name]
		if enum then
			if v.Shape==Enum.PartType.Block then
				terrain:FillBlock(v.CFrame,v.Size,enum)
			elseif v.Shape==Enum.PartType.Ball then
				terrain:FillBall(v.CFrame.p,v.Size.X,enum)
			end
			v.Transparency = 1
		end
	end
end
