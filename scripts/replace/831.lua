--game.Lighting.TimeOfDay="5:30:00"
-- game.Lighting.OutdoorAmbient = Color3.new(199, 199, 199)
--game.Lighting.GeographicLatitude = "-100"
--game.Lighting.FogEnd = 600

for i,v in next,script:children'' do v.Parent = game:service'Lighting' end
