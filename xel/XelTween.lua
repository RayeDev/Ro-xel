local XelTween = {}
local TS = game:GetService("TweenService")

function XelTween:Tween(object:any,value:any,duration:number,options:any)
	local Sex,EaseShit,EaseDirShit,rep
	if options.ease then
		if options.ease:match('cube') then EaseShit=Enum.EasingStyle.Cubic
		elseif options.ease:match('circ') then EaseShit=Enum.EasingStyle.Circular	
		elseif options.ease:match('sine') then EaseShit=Enum.EasingStyle.Sine
		elseif options.ease:match('linear') then EaseShit=Enum.EasingStyle.Linear
		elseif options.ease:match('back') then EaseShit=Enum.EasingStyle.Back
		elseif options.ease:match('bounce') then EaseShit=Enum.EasingStyle.Bounce
		elseif options.ease:match('elastic') then EaseShit=Enum.EasingStyle.Elastic
		elseif options.ease:match('expo') then EaseShit=Enum.EasingStyle.Exponential
		elseif options.ease:match('quart') then EaseShit=Enum.EasingStyle.Quart
		elseif options.ease:match('quint') then EaseShit=Enum.EasingStyle.Quint
		elseif options.ease:match('quad') then EaseShit=Enum.EasingStyle.Quad
		else EaseShit=Enum.EasingStyle.Linear	
		end
		if options.ease:match('Out') then EaseDirShit=Enum.EasingDirection.Out
		elseif options.ease:match('In') then EaseDirShit=Enum.EasingDirection.In	
		elseif options.ease:match('InOut') then EaseDirShit=Enum.EasingDirection.InOut
		else EaseDirShit=Enum.EasingDirection.Out	
		end
	end
	if options.startDelay then rep = options.startDelay else rep = 0 end
	Sex = TS:Create(object,TweenInfo.new(duration,EaseShit,EaseDirShit,0,false,rep),value)
	if options.onComplete then Sex.Completed:Connect(function() options.onComplete() end) end
	Sex:Play()
end

return XelTween