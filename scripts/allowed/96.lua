local TriggerPart=script.Parent
local TriggerCFrame=TriggerPart.CFrame
local TriggerOffset=TriggerCFrame:VectorToWorldSpace(Vector3.new(0,100,0))
return function(Tools)
	return function(Button,Time)
		local TriggerOn=Button:GetAttribute'TriggerOn' --boolean attribute on the button determines when the trigger is enabled
		if TriggerOn then
			return {CFrame=TriggerCFrame,Transparency=0}
		else
			return {CFrame=TriggerCFrame+TriggerOffset,Transparency=1}
		end
	end
end