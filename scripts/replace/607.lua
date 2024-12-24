local initialPos = script.Parent.CFrame
return function(Tools, PartCopy, SharedContext)
	return function(ActivationTime)
		return {CFrame = CFrame.new(initialPos.X, initialPos.Y + 100, initialPos.Z) * initialPos.Rotation}
	end
end
