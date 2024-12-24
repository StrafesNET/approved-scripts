-- Using SharedContext to share data across multiple interactives

local FadeTime = .5
local StartingTransparency = .6

local function len(t)
	local c = 0
	for _,_ in next,t do
		c += 1
	end
	return c
end

return function(Tools, PartCopy, SharedContext)
	SharedContext.Collected1 = {}
	-- LuCAS for time-controlled effects
	local LuCAS=Tools.LuCAS
	local Piecewise=LuCAS.Piecewise
	local Piece=LuCAS.Piece
	local lt=LuCAS.LessThan
	local t=LuCAS.Var't'
	return function(ActivationTime)
		SharedContext.Collected1[script.Name] = true
		if len(SharedContext.Collected1) == 3 then
			SharedContext.Collected1.done = true -- Prevent this from firing again after its done once
			local tsa = t - ActivationTime -- Time Since Activation
			-- shorter names for convenience
			local ft = FadeTime
			local st = StartingTransparency
			return {CanCollide=true, Transparency=Piecewise(
				Piece(lt(tsa, ft), st*(ft-tsa)/ft), -- Appearing
				Piece(true, 0)                      -- Appeared
			)}
		end
	end
end