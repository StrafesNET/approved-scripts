local Lighting=game:GetService'Lighting'
for _,effect in script:GetChildren() do
	effect.Parent=Lighting
end
Lighting.GlobalShadows=false
