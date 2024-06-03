---//Lighting---
local Lighting = game:GetService'Lighting'
Lighting.ClockTime = script.TimeS.Value
Lighting.Ambient = script.AmbientS.Value

local O = script.OutlinesS.Value
Lighting.GlobalShadows = not O

---//Effects//---
local Enabled = script.EnabledEffects.Value

if Enabled then
	for _,v in script.Effects:GetChildren() do
		v.Parent = Lighting
	end
end