local XelSound = {}
local sound
function XelSound:MakeSound(soundID:number, volume:number, playbackSpeed:number, looped:boolean, parent:Instance)
	sound = Instance.new("Sound")
	sound.Name = "Sound."..math.random(-999999,999999)
	sound.SoundId = "rbxassetid://"..soundID or 0
	sound.Volume = volume or 1
	sound.PlaybackSpeed = playbackSpeed or 1
	sound.Looped = looped or false
	sound.Parent = parent or script
end
function XelSound:PlaySound()
	sound:Play()
end
function XelSound:SetProperty(property:string,value:any)
	if property == "SoundId" then
		sound.SoundId = "rbxassetid://"..value
	elseif property == "Volume" then
		sound.Volume = value
	elseif property == "PlaybackSpeed" then
		sound.PlaybackSpeed = value
	elseif property == "Looped" then
		sound.Looped = value
	elseif property == "TimePosition" then
		sound.TimePosition = value
	else
		error("ERROR: The Propery or Value has returned Nil, go do research kid.")
	end
end
function XelSound:GetProperty(property:string)
	if property == "SoundId" then
		return sound.SoundId
	elseif property == "Volume" then
		return sound.Volume
	elseif property == "PlaybackSpeed" then
		return sound.PlaybackSpeed
	elseif property == "Looped" then
		return sound.Looped
	elseif property == "TimePosition" then
		return sound.TimePosition
	elseif property == "TimeLength" then
		return sound.TimeLength
	else
		error("ERROR: The Propery has returned Nil, go do research kid.")
	end
end
return XelSound