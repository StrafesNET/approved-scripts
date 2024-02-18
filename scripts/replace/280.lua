local ls = script.Parent.LShort.Brightness
local ll = script.Parent.LLong.Brightness


while true do
	script.Parent.PShort.Enabled = true
	script.Parent.PShort2.Enabled = true
	script.Parent.PShort3.Enabled = true
	script.Parent.PLong.Enabled = true
	script.Parent.PLong2.Enabled = true
	script.Parent.PLong3.Enabled = true
	script.Parent.LShort.Brightness = 10
	script.Parent.LLong.Brightness = 1
	script.Parent.Smoke.Enabled = true
	script.Parent.Smoke2.Enabled = true
	wait(0.1)
	script.Parent.PShort.Enabled = false
	script.Parent.PShort2.Enabled = false
	script.Parent.PShort3.Enabled = false
	script.Parent.PLong.Enabled = false
	script.Parent.PLong2.Enabled = false
	script.Parent.PLong3.Enabled = false
	script.Parent.Smoke.Enabled = false
	script.Parent.Smoke2.Enabled = false
	script.Parent.LShort.Brightness = 0.9
	script.Parent.LLong.Brightness = 0.9
	wait()
	script.Parent.LShort.Brightness = 0.8
	script.Parent.LLong.Brightness = 0.8
	wait()
	script.Parent.LShort.Brightness = 0.7
	script.Parent.LLong.Brightness = 0.7
	wait()
	script.Parent.LShort.Brightness = 0.6
	script.Parent.LLong.Brightness = 0.6
	wait()
	script.Parent.LShort.Brightness = 0.5
	script.Parent.LLong.Brightness = 0.5
	wait()
	script.Parent.LShort.Brightness = 0.4
	script.Parent.LLong.Brightness = 0.4
	wait()
	script.Parent.LShort.Brightness = 0.3
	script.Parent.LLong.Brightness = 0.3
	wait()
	script.Parent.LShort.Brightness = 0.2
	script.Parent.LLong.Brightness = 0.2
	wait()
	script.Parent.LShort.Brightness = 0.1
	script.Parent.LLong.Brightness = 0.1
	wait()
	script.Parent.LShort.Brightness = 0
	script.Parent.LLong.Brightness = 0
	wait(0)
end