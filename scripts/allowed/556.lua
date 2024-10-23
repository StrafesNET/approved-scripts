local l=game:GetService('Lighting')

script.Parent.Sky.Parent=l

l.Ambient=Color3.fromRGB(125,94,73)
l.Brightness=2
l.ColorShift_Bottom=Color3.new(0,0,0)
l.ColorShift_Top=Color3.new(1,1,1)
l.EnvironmentDiffuseScale=.2
l.EnvironmentSpecularScale=.2
l.OutdoorAmbient=Color3.new(0,0,0)
l.ShadowSoftness=.5
l.ClockTime=9.383
l.TimeOfDay='09:22:58'