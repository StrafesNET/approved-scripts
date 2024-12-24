local Model=script.Parent.Parent
local DestPos=Model.closedOne.Position
local PressTime=0.5
local DownTime=2
local UnpressTime=0.5
return function(Tools,PartCopy,SharedContext)
	local PartPos=PartCopy.Position

	local LuCAS=Tools.LuCAS
	local t=LuCAS.Var't'
	local PartPos=LuCAS.Vector(PartPos)
	local DestPos=LuCAS.Vector(DestPos)
	local PressUntilTime=0+PressTime
	local DownUntilTime=PressUntilTime+DownTime
	local UnpressUntilTime=DownUntilTime+UnpressTime
	local AnimationTime=PressTime+DownTime+UnpressTime
	local AllowActivate=0
	return function(ActivationTime)
		if AllowActivate<ActivationTime then
			AllowActivate=ActivationTime+AnimationTime
			return {Position=LuCAS.Piecewise(
				--Close
				LuCAS.Piece(LuCAS.LessThan(t-ActivationTime,PressUntilTime),LuCAS.Lerp(PartPos,DestPos,(t-ActivationTime)/PressTime)),
				--Stay closed
				LuCAS.Piece(LuCAS.LessThan(t-ActivationTime,DownUntilTime),DestPos),
				--Open
				LuCAS.Piece(LuCAS.LessThan(t-ActivationTime,UnpressUntilTime),LuCAS.Lerp(DestPos,PartPos,(t-(ActivationTime+DownUntilTime))/UnpressTime)),
				--Stay open
				LuCAS.Piece(true,PartPos)
			)}
		end
	end
end
