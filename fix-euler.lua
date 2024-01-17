local function toAxisAngleMoreStable(R)
    local px, py, pz, xx, yx, zx, xy, yy, zy, xz, yz, zz = R:components()
    local ax, ay, az = yz - zy, zx - xz, xy - yx
    local kCos = xx + yy + zz - 1
    local kSin = math.sqrt(ax*ax + ay*ay + az*az)
    return Vector3.new(ax, ay, az)/kSin,
        math.atan2(kSin, kCos)
end
print(toAxisAngleMoreStable(CFrame.fromEulerAnglesXYZ(0.01,-0.01,0.01)))