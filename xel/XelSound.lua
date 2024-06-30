local XelSound = {}
local sound
function XelSound:MakeSound(name:string, soundID:number, volume:number, parent:Instance)
	sound = Instance.new("Sound")
	sound.Name = name
	sound.SoundId = "rbxassetid://"..soundID or 0
	sound.Volume = volume or 1
	sound.Parent = parent or script
end
function XelSound:PlaySound(name:string)
	if name == sound.Name then
		sound:Play()
	else
		error("ERROR: The Name has returned Nil, go do research kid.")
	end
end
function XelSound:SetProperty(name:string, property:string,value:any)
	if name == sound.Name then
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
	else
		error("ERROR: The Name has returned Nil, go do research kid.")
	end
end
function XelSound:GetProperty(name:string, property:string)
	if name == sound.Name then
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
	else
		error("ERROR: The Name has returned Nil, go do research kid.")
	end
end
return XelSound