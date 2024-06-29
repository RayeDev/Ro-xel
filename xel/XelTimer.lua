local XelTimer = {}
local nam = ""
local timez = 0

function XelTimer:MakeTimer(name:string,time:number)
	nam = name
	timez = time
end

function XelTimer:StartTimer(name:string)
	if name == nam then
		repeat timez -= 1 task.wait(1) until timez == 0
	else
		error("Timer Doesn't exist, make a timer using XelTimer:MakeTimer()")
	end
end


function XelTimer:CallBack(name:string,callBack:any)
	if name == nam and callBack then
		callBack()
	else
		error("Timer Doesn't exist, make a timer using XelTimer:MakeTimer()")
	end
end

return XelTimer