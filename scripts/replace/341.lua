function del(p)
	for i,v in pairs(p:GetChildren()) do
		if(v:IsA("BasePart")) then
			v.CastShadow = false
		else
			del(v)
		end  
	end
end

del(workspace.surf_abseil) -- Credit to SouGood for the script!
-- READ ME: Fixes consist of majority of the Texture Clipping, Placing Textures where vacent, Naming parts so they are easier to select or find & Ramp Bugs