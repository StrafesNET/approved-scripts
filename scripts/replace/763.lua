local p1 = script.Parent.p1
local p2 = script.Parent.p2
local p3 = script.Parent.p3

while true do
	p3.Transparency = 0
	wait(0.2)
	p2.Transparency = 0
	wait(0.2)
	p1.Transparency = 0
	wait(1)
	p3.Transparency = 1
	wait(0.2)
	p2.Transparency = 1
	wait(0.2)
	p1.Transparency = 1
	wait(1)
	p3.Transparency = 0
	p2.Transparency = 0
	p1.Transparency = 0
	wait(0.2)
	p3.Transparency = 1
	p2.Transparency = 1
	p1.Transparency = 1
	wait(0.2)
	p3.Transparency = 0
	p2.Transparency = 0
	p1.Transparency = 0
	wait(1)
	p3.Transparency = 1
	wait(0.2)
	p2.Transparency = 1
	wait(0.2)
	p1.Transparency = 1
	wait(1)
end