local Part=script.Parent
local BaseCFrame=Part.CFrame
local RotVelocity=Vector3.new(0,Part.Speed.Value*math.pi/6,0)/2
return function(Tools)
	local LuCAS=Tools.LuCAS
	local t=LuCAS.Var't'
	local BaseQ=LuCAS.Quaternion(BaseCFrame)
	local RotQ=LuCAS.AxisAngle(RotVelocity)
	return {Orientation=BaseQ*LuCAS.QExp(RotQ*t)}
end