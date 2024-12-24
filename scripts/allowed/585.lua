local Lighting = game:GetService'Lighting'

script.Sky.Parent = Lighting
script.Atmosphere.Parent = Lighting
script.Clouds.Parent = workspace.Terrain
script.FinishFancyMapBox.Parent = script.Parent.MapFinish
script.StartFancyMapBox.Parent = script.Parent.MapStart
script.Bonus1StartFancyMapBox.Parent = script.Parent.Bonus1Start
script.Bonus1FinishFancyMapBox.Parent = script.Parent.Bonus1Finish
script.Parent.MapFinish.FinishFancyMapBox.Enabled = true
script.Parent.MapStart.StartFancyMapBox.Enabled = true
script.Parent.Bonus1Start.Bonus1StartFancyMapBox.Enabled = true
script.Parent.Bonus1Finish.Bonus1FinishFancyMapBox.Enabled = true
Lighting.ClockTime = 14
