local Sound=script.Parent.Sound
local LocalPlayer=game:GetService'Players'.LocalPlayer
if LocalPlayer then
	return function(Tools)
		return function(Button,Time)
			local NewSound=Sound:Clone()
			NewSound.Parent=LocalPlayer.PlayerGui
			NewSound.Ended:Connect(function()
				NewSound:Destroy()
			end)
			NewSound:Play()
		end
	end
end