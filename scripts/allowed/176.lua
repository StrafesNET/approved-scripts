local Frequency=0.25
local RotSpeed=Frequency*2*math.pi/2
local Part=script.Parent
local PartCFrame=Part.CFrame
return function(Tools)
	--Lua Computer Algebra System
	local LuCAS=Tools.LuCAS
	--t is time
	local t=LuCAS.Var't'
	--Quaternion exp
	local QExp=LuCAS.QExp
	--Quaternions can be created from roblox CFrames or with components
	local PartOrientation=LuCAS.Quaternion(PartCFrame)
	--Axis angle can represent any rotational velocity.  2 radians per second of rotation on the y axis
	local RotVelocity=LuCAS.AxisAngle(0,RotSpeed,0)
	--Return analytic equations for each part property you want to animate
	return {Orientation=PartOrientation*QExp(RotVelocity*t)}
end