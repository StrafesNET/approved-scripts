local r=math.random
local s = Instance.new("Sound")
s.Name = "Sound"
s.SoundId = "http://www.roblox.com/asset/?id=24902294"
s.Volume = 10
s.Looped = false
s.Archivable = false
s.Parent = script.Parent
local Moos={"http://www.roblox.com/asset/?id=24902268","http://www.roblox.com/asset/?id=24902294"}
local NMoos=#Moos
while wait(6+r()*5) do
	s.SoundId=Moos[r(NMoos)]
	s:Play()
end 