local BUTTON_KEY = "I hate cheese"
local BUTTON_COUNT = #script.Parent:GetChildren()

local FakeFinish = script.Parent.Parent:WaitForChild("FakeBonus1Finish")
local OriginalCFrame = FakeFinish.CFrame

local ButtonId = tonumber(script.Name:match("^Interactive(%d+)$"))

return function(Tools, ClonedPart, SharedContext)
	SharedContext[BUTTON_KEY] = 0

	return function(Time)
		if SharedContext[BUTTON_KEY] == ButtonId - 1 then
			SharedContext[BUTTON_KEY] = ButtonId
		end

		if SharedContext[BUTTON_KEY] == BUTTON_COUNT then
			return {CFrame = OriginalCFrame}
		end

		return {}
	end
end