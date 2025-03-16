local Lighting = game:GetService'Lighting'
--Lighting.TimeOfDay="5:30:00"
--Lighting.OutdoorAmbient = Color3.new(199, 199, 199)
--Lighting.GeographicLatitude = "-100"
--Lighting.FogEnd = 600

for _,effect in script:GetChildren() do
	effect.Parent = Lighting
end
