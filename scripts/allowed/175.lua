--This is an example of a moving platform that only uses a static motion equation
local Part=script.Parent
local Model=Part.Parent
local A=Part.Position
local B=Model.Destination.Position
--Initialization function called by game code with references to game libraries
return function(Tools)
	local LuCAS=Tools.LuCAS
	--t is time
	local t=LuCAS.Var't'
	--Vectors can be created from roblox Vector3s or with components
	local APos=LuCAS.Vector(A)
	local BPos=LuCAS.Vector(B)
	--linear forwards from A to B during t=0 to t=1, and then back from B to A from t=1 to t=2
	--like lerp but also goes back
	local fab=LuCAS.forwardsandback

	local Period=2

	local MotionEquation=fab(APos,BPos,t/Period)
	--Return analytic equations for each part property you want to animate
	return {Position=MotionEquation}
end