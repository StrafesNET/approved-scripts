local X 		--\
local Y 		---> Don't edit these.
local Z 		--/
--------------------------------------------------------------

-- Rotations per frame:

X=	-- Degree of rotation per frame on X Axis:

1

--------------------------------------------------------------

Y=	-- Degree of rotation per frame on Y Axis:

1

--------------------------------------------------------------

Z=	-- Degree of rotation per frame on Z Axis:

1


-- NOTE: A frame is usually around 0.03 seconds.
--------------------------------------------------------------

local c=CFrame.fromEulerAnglesXYZ(math.rad(X),math.rad(Y),math.rad(Z))
function start() 
	while (true) do 
		script.Parent.CFrame = script.Parent.CFrame * c
		wait() 	-- When no number is provided, it will wait for one frame.		|			|			|
	end 			--													|			|			[Z=Roll]
end 				--													|			[Y=Rotation]
				--													[X=Pitch]
start() 







							--[[		�<( crazyman32 )>�		]]--