local Global = true -- keep this on, if u want to figure out what it doe ask me
local YOffset = 190 -- Distance it will go vertically
return function(PartClone,Tools)
	return function(Button,ActivationTime)
		if Global then
			return {CFrame = script.Parent.CFrame + Vector3.new(0,YOffset,0)}
		else
			return {CFrame = script.Parent.CFrame * CFrame.new(0,YOffset,0)}
		end
	end
end