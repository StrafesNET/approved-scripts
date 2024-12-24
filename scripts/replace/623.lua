script.Parent.Transparency = 1;

--You can change the size of the "Rain" Part (where you want the rain)

--These Green messages will tell you what you can change :>
--If there's no message dont change anything 

local Part = script.Parent
local A = Part.Rain1
local B = Part.Rain2
local C = Part.Rain3
local D = Part.ParticleEmitter    D.Enabled = false --DONT CHANGE(Might ruin the Particles)

local RainSpeed = 250 --Change it to something(anything less than 50 COULD have some issues)
local RainDrops = 12500 -- change this to how much rain you want



------DONT CHANGE (FUNCTIONS HERE)------

---Speed Of Rain---

A.Speed = RainSpeed
B.Speed = RainSpeed
C.Speed = RainSpeed


----Number Of Raindrops----

A.Rate = RainDrops
B.Rate = RainDrops
C.Rate = RainDrops
--⬆
--Delete the -- Before the A, B, C for the raindrops to work

--Script and Particle By F̶i̶k̶0̶s̶z̶_̶M̶a̶s̶t̶e̶r̶ fodback
--Made On /12th of November 2022/