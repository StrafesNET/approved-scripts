local colors = {
	Color3.fromRGB(255, 102, 64),
	Color3.fromRGB(172, 57, 255),
	Color3.fromRGB(4, 175, 236),
	Color3.fromRGB(135, 255, 83)
};
for _, part in script.Parent:GetDescendants() do
	if part.Name == "neon_beam" then
		local pointLight;
		local partInside;

		-- pointlight and part inside the current beam
		for _, desc in part:GetDescendants() do
			if desc:IsA("PointLight") then
				pointLight = desc;
			elseif desc:IsA("Part") then
				partInside = desc;
			end
		end

		if partInside then
			partInside.Color = colors[math.random(1, #colors)];
			--[[
			partInside.Size.X = part.Size.X;
			partInside.Size.Y = part.Size.Y - 0.5;
			partInside.Size.Z = part.Size.Z - 0.5;
			]]

			if pointLight then
				pointLight.Color = partInside.Color;
				pointLight.Range = 10000; -- 225
				pointLight.Brightness = 2.25; -- 2.5
			end
		end
	end
end

script:Destroy();
