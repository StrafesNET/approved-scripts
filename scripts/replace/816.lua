game.Lighting.TimeOfDay = "07:00:00"
game.Lighting.OutdoorAmbient = Color3.new(0.9,0.9,0.9)
for i,v in next,script:children'' do v.Parent = game:service'Lighting' end