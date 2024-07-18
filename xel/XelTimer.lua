local XelTimer = {
	duration = 1;
	callback = nil;
	loops = 1;
	elapsed = 0;
	running = false;
	finished = false;
}
function XelTimer.new(duration, loops, callback)
	XelTimer.duration = duration or 1
	XelTimer.callback = callback or nil
	XelTimer.loops = loops or 1
	XelTimer:reset()
end
function XelTimer:update(dt)
	if not XelTimer.running then return end
	XelTimer.elapsed += dt
	if XelTimer.elapsed >= XelTimer.duration then
		XelTimer.elapsed -= XelTimer.duration
		if XelTimer.callback then XelTimer.callback() end
		if XelTimer.loops > 1 then
			XelTimer.loops -= 1
		else
			XelTimer.finished = true
			XelTimer.running = false
		end
	end
end
function XelTimer:start() XelTimer.running = true XelTimer.finished = false end
function XelTimer:stop() XelTimer.running = false end
function XelTimer:reset() XelTimer.elapsed = 0 XelTimer.running = false XelTimer.finished = false end
function XelTimer:isRunning() return XelTimer.running end
function XelTimer:isFinished() return XelTimer.finished end
return XelTimer
