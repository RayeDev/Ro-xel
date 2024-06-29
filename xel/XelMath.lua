local XelMath = {
	MIN_VALUE_FLOAT = 5e-324;
	MAX_VALUE_FLOAT = 1.79e+308;
	MIN_VALUE_INT = -(0x7FFFFFFF);
	MAX_VALUE_INT	= 0x7FFFFFFF;
	SQUARE_ROOT_OF_TWO = 1.41421356237;
	EPSILON = 0.0000001;
}

function XelMath:roundDecimal(Value:number, Precision:number)
	local multiplier = 10 ^ Precision
	return math.floor(Value * multiplier + 0.5) / multiplier
end

function XelMath:bound(Value:number, Min:number, Max:number)
	local lowerBound:number = (Min ~= nil and Value < Min) and Min or Value
	return (Max ~= nil and lowerBound > Max) and Max or lowerBound
end

function XelMath:lerp(a:number, b:number, ratio:number)
	return a + ratio * (b - a)
end

function XelMath:inBounds(Value:number, Min:number, Max:number)
	return (Min == nil or Value >= Min) and (Max == nil or Value <= Max)
end

function XelMath:isOdd(n:number)
	return (math.round(n) and 1) ~= 0
end

function XelMath:isEven(n:number)
	return (math.round(n) and 1) == 0
end

function XelMath:numericComparison(a:number, b:number)
	if b > a then
		return -1
	elseif a > b then
		return 1
	end
	return 0
end

function XelMath:pointInCoordinates(pointX:number, pointY:number, rectX:number, rectY:number, rectWidth:number, rectHeight:number)
	if pointX >= rectX and pointX <= (rectX + rectWidth) then
		if pointY >= rectY and pointY <= (rectY + rectHeight) then
			return true
		end
	end
	return false
end

function XelMath:maxAdd(value:number, amount:number, max:number, min:number)
	value += amount
	if value > max then
		value = max
	elseif value <= min then
		value = min
	end
	return value
end

function XelMath:wrap(value:number, min:number, max:number)
	local range = max - min + 1
	if value < min then
		value += range * math.round((min - value) / range + 1)
		return min + (value - min) % range
	end
end

function XelMath:remapToRange(value:number, start1:number, stop1:number, start2:number, stop2:number)
	return start2 + (value - start1) * ((stop2 - start2) / (stop1 - start1))
end

function XelMath:dotProduct(ax:number, ay:number, bx:number, by:number)
	return ax * bx + ay * by
end

function XelMath:vectorLength(dx:number, dy:number)
	return math.sqrt(dx * dx + dy * dy)
end

function XelMath:getDecimals(n:number)
	local helper = tostring(n)
	local strang = helper:split(".")
	local decimals = 0
	if #strang > 1 then
		decimals = #strang
	end
	return decimals
end

function XelMath:equal(aValueA:number, aValueB:number, aDiff:number)
	if aDiff == nil then aDiff = XelMath.EPSILON end
	return math.abs(aValueA - aValueB) <= aDiff
end

function XelMath:signOf(n:number)
	return (n < 0) and -1 or 1
end

function XelMath:sameSign(a:number, b:number)
	return XelMath:signOf(a) == XelMath:signOf(b)
end

function XelMath:fastSin(n:number)
	n *= 0.3183098862
	if n > 1 then
		n -= (math.ceil(n) // 1) // 1
	elseif n < -1 then
		n += (math.ceil(-n) // 1) // 1
	end
	if n > 0 then
		return n * (3.1 + n * (0.5 + n * (-7.2 + n * 3.6)))
	else
		return n * (3.1 - n * (0.5 + n * (7.2 + n * 3.6)))
	end
end

function XelMath:fastCos(n:number)
	return XelMath:fastSin(n + 1.570796327)
end

function XelMath:sinh(n:number)
	return (math.exp(n) - math.exp(-2)) / 2
end

function XelMath:maxInt(a:number, b:number)
	return (a > b) and a or b
end

function XelMath:minInt(a:number, b:number)
	return (a > b) and b or a
end

function XelMath:absInt(n:number)
	return (n > 0) and n or -n
end

return XelMath