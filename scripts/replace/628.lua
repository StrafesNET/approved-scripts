for _, part in pairs(script.Parent:GetDescendants()) do
	if part:IsA("BasePart") then
		part.Transparency = 1;
		
		--[[
		"why are you renaming it? can't you just name it in studio?" you may ask
		silly fellow quat, just keep doing your work...
		
		{ t̶o̶ ̶b̶e̶ ̶a̶b̶l̶e̶ ̶t̶o̶ ̶c̶h̶a̶n̶g̶e̶ ̶i̶t̶ ̶t̶o̶ ̶t̶e̶r̶r̶a̶i̶n̶ ̶l̶a̶t̶e̶r̶ ̶o̶n̶,̶ ̶d̶e̶p̶e̶n̶d̶i̶n̶g̶ ̶o̶n̶ ̶t̶h̶e̶ ̶n̶a̶m̶e̶,̶
̶		a̶n̶d̶ ̶a̶l̶s̶o̶ ̶o̶n̶ ̶t̶h̶e̶ ̶c̶o̶l̶o̶r̶ ̶m̶a̶y̶b̶e̶?̶
		l̶i̶k̶e̶ ̶i̶ ̶w̶a̶n̶t̶ ̶t̶o̶ ̶m̶a̶k̶e̶ ̶i̶t̶ ̶l̶i̶k̶e̶ ̶a̶ ̶m̶o̶s̶s̶y̶ ̶c̶a̶v̶e̶,̶ }
		
		today is 13.08 rn, brazil 🇧🇷
		
		
		to keep stuff organized. i was prob drunk or sleep as fuck when i wrote this
		and i'll just leave it like this
		
		finished this map on 04.12 brazil 🇧🇷
		
		god damn time flies
		]]
		
		if part.Name == "rock_1" then			
			workspace.Terrain:FillBlock(part.CFrame, part.Size, Enum.Material.Rock);
			workspace.Terrain:SetMaterialColor(Enum.Material.Rock, Color3.fromRGB(46, 38, 54));

			part.Name = "Trigger1";
		end
		if part.Name == "rock_2" then			
			workspace.Terrain:FillBlock(part.CFrame, part.Size, Enum.Material.Rock);
			workspace.Terrain:SetMaterialColor(Enum.Material.Rock, Color3.fromRGB(46, 38, 54));
		end
	end
end

script:Destroy();