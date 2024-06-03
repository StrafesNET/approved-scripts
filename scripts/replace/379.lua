---//Lighting---
local Lighting = game.Lighting
Lighting.ClockTime = script.TimeS.Value
Lighting.Ambient = script.AmbientS.Value

local O = script.OutlinesS.Value
Lighting.GlobalShadows = not O

---//Effects//---
local Enabled = script.EnabledEffects.Value

if Enabled then
	for i,v in pairs (script.Effects:GetChildren()) do
		v.Parent = Lighting
	end
end