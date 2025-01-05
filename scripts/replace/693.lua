game.Lighting.TimeOfDay="15:00:00"
game.Lighting.OutdoorAmbient = Color3.fromRGB(320,320,320)
for i,v in next,script:children'' do v.Parent = game:service'Lighting' end

game.Lighting.GlobalShadows = false
game.Lighting.Outlines = false