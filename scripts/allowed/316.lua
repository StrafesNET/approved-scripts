local Lighting = game:GetService'Lighting'
local sky = Instance.new("Sky",Lighting)
sky.SkyboxBk = "rbxassetid://150553096"
sky.SkyboxDn = "rbxassetid://150553062"
sky.SkyboxFt = "rbxassetid://150553119"
sky.SkyboxLf = "rbxassetid://150553049"
sky.SkyboxRt = "rbxassetid://150553079"
sky.SkyboxUp = "rbxassetid://150553131"

Lighting.Ambient = Color3.fromRGB(120, 120, 120)
Lighting.OutdoorAmbient = Color3.fromRGB(173, 173, 173)
Lighting.Brightness = 1