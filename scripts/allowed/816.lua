local Lighting = game:GetService'Lighting'
Lighting.TimeOfDay = "07:00:00"
Lighting.OutdoorAmbient = Color3.new(0.9,0.9,0.9)
for _,effect in script:GetChildren() do
	effect.Parent = Lighting
end
