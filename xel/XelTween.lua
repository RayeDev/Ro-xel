local Ease = require(script.Parent.Ease)

-- Tween v1.7 | Made by Goober :3
local TweenManager = {
	tweens = {}
}

local XelTween = {}
XelTween.__index = XelTween

function XelTween.new(target, duration, values, params)
	local self = setmetatable({}, XelTween)
	self.target = target
	self.duration = duration
	self.elapsed = 0
	self.completed = false
	self.ease = Ease.linear -- Default to linear easing
	self.startDelay = params.startDelay or 0
	self.onComplete = params.onComplete

	-- Initialize initial and target values
	self.startValues = {}
	self.endValues = {}

	for k, v in pairs(values) do
		self.startValues[k] = target[k]
		self.endValues[k] = v
	end

	-- Set easing function
	self.ease = params.ease or Ease.linear

	table.insert(TweenManager.tweens, self)
	return self
end

function Tween.update(dt)
	-- Create a temporary table for efficient iteration
	local activeTweens = {}
	for i, tween in ipairs(TweenManager.tweens) do
		if not tween.completed then
			table.insert(activeTweens, tween)
		end
	end

	for _, tween in ipairs(activeTweens) do
		if tween.startDelay > 0 then
			tween.startDelay = tween.startDelay - dt
			if tween.startDelay > 0 then
				continue
			end
			dt = math.abs(tween.startDelay)
			tween.elapsed = tween.elapsed + dt
			tween.startDelay = 0
		else
			tween.elapsed = tween.elapsed + dt
		end

		local progress = math.min(tween.elapsed / tween.duration, 1)
		local easedProgress = tween.ease(progress)

		for k, startValue in pairs(tween.startValues) do
			local endValue = tween.endValues[k]
			tween.target[k] = startValue + (endValue - startValue) * easedProgress
		end

		if progress >= 1 then
			tween.completed = true
			if tween.onComplete then
				tween.onComplete()
			end
		end
	end

	-- Remove completed tweens from the main table
	for i = #TweenManager.tweens, 1, -1 do
		if TweenManager.tweens[i].completed then
			table.remove(TweenManager.tweens, i)
		end
	end
end

return XelTween
