local OpeningTime=script.OpeningTime.Value
local StayOpenTime=script.StayOpenTime.Value
local ClosingTime=script.ClosingTime.Value
local TurnAmount=CFrame.Angles(0,2*math.pi*script.ClockwiseTurns.Value,0)
local HingeCFrame=script.Parent.Parent.CFrame
return function(Tools,PartCopy,SharedContext)
	--PartCopy is a clone of the original part that the game has made for this player
	local ClosedCFrame=PartCopy.CFrame
	local RelativeCFrame=HingeCFrame:inverse()*ClosedCFrame

	local LuCAS=Tools.LuCAS

	local OpeningUntilTime=0+OpeningTime
	local StayOpenUntilTime=OpeningUntilTime+StayOpenTime
	local ClosingUntilTime=StayOpenUntilTime+ClosingTime
	local AnimationTime=OpeningTime+StayOpenTime+ClosingTime

	local OpenCFrame=LuCAS.CFrame(HingeCFrame*TurnAmount*RelativeCFrame)
	local HingeCFrame=LuCAS.CFrame(HingeCFrame)
	local ClosedCFrame=LuCAS.CFrame(ClosedCFrame)
	local RelativeCFrame=LuCAS.CFrame(RelativeCFrame)
	local RotationDifference=LuCAS.AxisAngle(TurnAmount)

	local t=LuCAS.Var't'
	local AllowActivate=0
	return function(ActivationTime)
		--Timesince activation
		if AllowActivate<ActivationTime then
			AllowActivate=ActivationTime+AnimationTime
			local ta=t-ActivationTime
			return {CFrame=LuCAS.Piecewise(
				LuCAS.Piece(LuCAS.LessThan(ta,OpeningUntilTime),HingeCFrame*LuCAS.QExp(RotationDifference*((ta/OpeningTime)/2))*RelativeCFrame),
				LuCAS.Piece(LuCAS.LessThan(ta,StayOpenUntilTime),OpenCFrame),
				LuCAS.Piece(LuCAS.LessThan(ta,ClosingUntilTime),HingeCFrame*LuCAS.QExp(RotationDifference*((1-(ta-StayOpenUntilTime)/ClosingTime)/2))*RelativeCFrame),
				LuCAS.Piece(true,ClosedCFrame)
				)}
		end
	end
end