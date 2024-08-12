local tick=tick
local abs=math.abs
local HalfTime=100/30
local ScaleOffset=Vector3.new(0,3.6,0)
local Mesh=script.Parent.Mesh
local InitialScale=Mesh.Scale
game:GetService'RunService'.Stepped:connect(function()
	local t=abs(1-tick()/HalfTime%2)
	Mesh.Scale=InitialScale+ScaleOffset*t
end)
