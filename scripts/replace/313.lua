--Settings--

song_ID = {145778741} -- replace the numbers with the ID's of the songs you want. (the URL end number)

randomizer = false -- set to true is a random number, set to false and it is in order

Wait_Time = 120 -- 120 is the max time for a sound/song. Add 5 seconds if you want a buffer between songs

inc = .05 -- this is the increment of which the volume increases/decreases for fade in/out.

--[[OWNER SETTINGS -- 
randomizer = false
Wait_Time = 1
inc = .1
]]

--functions and IDs--
asset_ID = "http://www.roblox.com/asset/?id="
function choose(tab) local obj = tab[math.random(1,#tab)] return obj end
function play(s) if s:IsA("Sound") then local o = s.Volume s.Volume = 0 s:play() for i = 0,o,inc do wait() s.Volume = i end s.Volume = o end end
function stop(s) if s:IsA("Sound") then local o = s.Volume for i = o,0,-inc do wait() s.Volume = i end s:stop() s.Volume = o end end
song = Instance.new("Sound",workspace) song.Name = "TigerCaptain's Music Player"


--loop--
counter = 1
if #song_ID > 0 then
while true do
wait()
if randomizer then song.SoundId = asset_ID..""..choose(song_ID) else song.SoundId = asset_ID..""..song_ID[counter] end
play(song)
wait(Wait_Time)
stop(song)
if counter >= #song_ID then counter = 1 else counter = counter + 1 end
end
end


