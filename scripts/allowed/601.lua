-- This script implements an unordered checkpoint using
-- SharedContext to share data across multiple interactives
-- unordered checkpoints are currently only available in strafe client...

local function len(t)
	local c = 0
	for _,_ in t do
		c += 1
	end
	return c
end

local scriptName = script.Name

return function(Tools, PartCopy, SharedContext)
	SharedContext.Collected1 = {}
	return function(ActivationTime)
		SharedContext.Collected1[scriptName] = true
		if len(SharedContext.Collected1) == 4 then
			SharedContext.Collected1.done = true -- Prevent this from firing again after its done once
			return {CanCollide=false, Transparency=1}
		end
	end
end
