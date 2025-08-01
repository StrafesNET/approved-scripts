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
local terrain=game.Workspace:WaitForChild("Terrain")
local deletePartsOnGeneration=true

local materials={
	['Sand']=Enum.Material.Sand
}

function goThrough(a)
	for i,v in pairs(a:GetChildren()) do
		if v then
			if v:IsA("BasePart") then
				for name,enum in pairs(materials) do
					local material = v.Material.Name
					if material and material == name then
						if v.Shape==Enum.PartType.Block then
							terrain:FillBlock(v.CFrame,v.Size,enum)
						elseif v.Shape==Enum.PartType.Ball then
							terrain:FillBall(v.CFrame.p,v.Size.X,enum)
						end
						if deletePartsOnGeneration==true then
							v.Transparency = 1
						end
						break
					end
				end
			end
			--if #v:GetChildren()>0 then
			--	spawn(function()goThrough(v)end)
			--end
		end
	end
end
goThrough(script.Parent)