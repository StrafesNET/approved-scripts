-- A basic instant property change (removing the wall)

return function(Tools, PartCopy, SharedContext)
	return function(ActivationTime)
		return {CanCollide=false, Transparency=1}
	end
end