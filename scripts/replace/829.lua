local Lighting = game:GetService("Lighting")
local tweenService = game:GetService("TweenService")
Lighting.GlobalShadows = false
Lighting.EnvironmentSpecularScale = 0.25
Lighting.EnvironmentDiffuseScale = 1
Lighting.Ambient = Color3.fromRGB(200,200,200)
Lighting.ClockTime = 0
script:WaitForChild("ColorGrading").Parent = Lighting

local tick=tick
local hours_per_second=5/60
local Lighting=game:GetService'Lighting'
local ClockTime0=Lighting.ClockTime
local t0=tick()
game:GetService'RunService'.Heartbeat:Connect(function()
	local hours=(tick()-t0)*hours_per_second
	Lighting.ClockTime=(ClockTime0+hours)%24
end)

local info = TweenInfo.new(12*(1/hours_per_second), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)
tweenService:Create(Lighting, info, {Ambient=Color3.fromRGB(100,100,100), EnvironmentDiffuseScale=0}):Play()