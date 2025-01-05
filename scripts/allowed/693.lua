local Lighting=game:GetService'Lighting'
Lighting.GlobalShadows=false
Lighting.Outlines=false
Lighting.TimeOfDay="15:00:00"
Lighting.OutdoorAmbient=Color3.fromRGB(320,320,320)

for _,effect in script:GetChildren() do
	effect.Parent=Lighting
end
