local XelStringUtil = {}

function XelStringUtil:formatTicks(StartTicks:number, EndTicks:number)
	return tostring(math.abs(EndTicks - StartTicks) / 1000) .. "s"
end

function XelStringUtil:formatTime(Seconds:number, ShowMS:boolean)
	ShowMS = ShowMS or false
	local timeString = tostring(math.floor(Seconds / 60)) .. ":"
	local timeStringHelper = math.floor(Seconds) % 60
	if timeStringHelper < 10 then
		timeString = timeString .. "0"
	end
	timeString = timeString .. tostring(timeStringHelper)
	if ShowMS then
		timeString = timeString .. "."
		timeStringHelper = math.floor((Seconds - math.floor(Seconds)) * 100)
		if timeStringHelper < 10 then
			timeString = timeString .. "0"
		end
		timeString = timeString .. tostring(timeStringHelper)
	end
	return timeString
end

function XelStringUtil:formatArray(AnyArray:{any})
	local string = ""
	if AnyArray and #AnyArray > 0 then
		string = tostring(AnyArray[1])
		for i = 2, #AnyArray do
			string = string .. ", " .. tostring(AnyArray[i])
		end
	end
	return string
end

function XelStringUtil:formatMoney(Amount:number, ShowDecimal:boolean, EnglishStyle:boolean)
	ShowDecimal = ShowDecimal or true
	EnglishStyle = EnglishStyle or true

	local isNegative = Amount < 0
	Amount = math.abs(Amount)

	local string = ""
	local comma = ""
	local amount = math.floor(Amount)

	while amount > 0 do
		if string:len() > 0 and comma:len() <= 0 then
			comma = EnglishStyle and "," or "."
		end
		local zeroes = ""
		local helper = amount - math.floor(amount / 1000) * 1000
		amount = math.floor(amount / 1000)
		if amount > 0 then
			if helper < 100 then zeroes = zeroes .. "0" end
			if helper < 10 then zeroes = zeroes .. "0" end
		end
		string = zeroes .. helper .. comma .. string
	end

	if string == "" then string = "0" end

	if ShowDecimal then
		amount = math.floor(Amount * 100) - (math.floor(Amount) * 100)
		string = string .. (EnglishStyle and "." or ",")
		if amount < 10 then string = string .. "0" end
		string = string .. amount
	end

	if isNegative then string = "-" .. string end

	return string
end

function XelStringUtil:toIntArray(Data:string)
	local iArray = {}
	for str in Data:gmatch("[^,%s]+") do
		table.insert(iArray, tonumber(str))
	end
	return iArray
end

function XelStringUtil:toFloatArray(Data:string)
	local fArray = {}
	for str in Data:gmatch("[^,%s]+") do
		table.insert(fArray, tonumber(str))
	end
	return fArray
end

return XelStringUtil 