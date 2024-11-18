local initialPos = script.Parent.CFrame
return function(Tools, PartCopy, SharedContext)
	return function(ActivationTime)
		if script.Name:sub(-4) == "9999" then
			return {CFrame = initialPos}
		else
			return {CFrame = CFrame.new(initialPos.X, initialPos.Y + 100, initialPos.Z) * initialPos.Rotation}
		end
	end
end