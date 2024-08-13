local CriticallyDampedBrownianSpring = {}

CriticallyDampedBrownianSpring.__index = CriticallyDampedBrownianSpring

local function gaussianRandom(m, v)
	local r = math.sqrt(-2*math.log(1 - math.random())*v)
	local a = 2*math.pi*math.random()
	return
		m + r*math.cos(a),
		m + r*math.sin(a)
end

function CriticallyDampedBrownianSpring.new(k, b, p0, v0)
	local self = setmetatable({}, CriticallyDampedBrownianSpring)

	self._k = k
	self._b = b

	self._p0 = p0
	self._v0 = v0

	return self
end

function CriticallyDampedBrownianSpring:setP(new)
	self._p0 = new
end

function CriticallyDampedBrownianSpring:setV(new)
	self._v0 = new
end

function CriticallyDampedBrownianSpring:setK(new)
	self._k = new
end

function CriticallyDampedBrownianSpring:setB(new)
	self._b = new
end

function CriticallyDampedBrownianSpring:step(dt)
	local b = self._b
	local k = self._k
	local t = dt

	local ex = math.exp(-k*t)
	local ex2 = ex*ex

	local aMean		 = 0
	local aVar		 = b*b*(1 - ex2)/(2*k)
	local bMeanScale = (ex2*(1 + 2*k*t) - 1)/(2*(ex2 - 1)*k)
	local bVar		 = b*b*(1 + ex2*ex2 - 2*ex2*(1 + 2*k*k*t*t))/(8*(1 - ex2)*k*k*k)

	if
		aMean ~= aMean or
		aVar ~= aVar or
		bMeanScale ~= bMeanScale or
		bVar ~= bVar
	then
		aMean = 0
		aVar = 0
		bMeanScale = 0
		bVar = 0
	end

	local aVariate_x,aVariate_y = gaussianRandom(aMean, aVar)
	local bVariate_x,bVariate_y = gaussianRandom(bMeanScale*aVariate_x, bVar),gaussianRandom(bMeanScale*aVariate_y, bVar)
	local aVariate_z = gaussianRandom(aMean, aVar)
	local bVariate_z = gaussianRandom(bMeanScale*aVariate_z, bVar)

	local aVariate = Vector3.new(aVariate_x,aVariate_y,aVariate_z)
	local bVariate = Vector3.new(bVariate_x,bVariate_y,bVariate_z)

	local p0 = self._p0
	local v0 = self._v0
	self._p0 = ex*((1 + k*t)*p0 + t*v0) + bVariate
	self._v0 = ex*(v0 - k*t*(k*p0 + v0)) + aVariate - k*bVariate

	return
		self._p0,
		self._v0
end

local shake_intensity = 4
local shake_random_frequency = 6
local shake_wander_lasso = 10
local offset=math.log(0.3)

local Lights = {}
for _,Model in script.Parent:GetChildren() do
	if Model:IsA'Model' then
		local cdbs = CriticallyDampedBrownianSpring.new(shake_wander_lasso, shake_random_frequency)
		cdbs:setP(Vector3.zero)
		cdbs:setV(Vector3.zero)
		local Parts={}
		for _,Part in Model:GetChildren() do
			if Part.Name=="Light" then
				table.insert(Parts,Part)
			end
		end
		table.insert(Lights,{
			cdbs=cdbs,
			Parts=Parts,
		})
	end
end

local tick=tick
local LastTime=tick()
game:GetService'RunService'.Stepped:Connect(function()
	local TimeNow=tick()
	local dt=TimeNow-LastTime
	LastTime=TimeNow
	for _,Light in Lights do
		local Intensity=math.exp(offset+Light.cdbs:step(dt).x*shake_intensity)
		for _,Part in Light.Parts do
			Part.Transparency=Intensity
		end
	end
end)
