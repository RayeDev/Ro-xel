local XelDebug = {}

local GUI,Text
local XelTween = require(script.Parent.XelTween)

function XelDebug:Init()
	GUI = Instance.new("ScreenGui",game.StarterGui)
	Text = Instance.new("TextLabel",GUI)
	
	--UI's
	local UIAspectRatio = Instance.new("UIAspectRatioConstraint",Text)
	local UITextSize = Instance.new("UITextSizeConstraint",Text)
	local UIStroke = Instance.new("UIStroke",Text)
	
	UIAspectRatio.AspectRatio = 4
	UIAspectRatio.AspectType = Enum.AspectType.FitWithinMaxSize
	UIAspectRatio.DominantAxis = Enum.DominantAxis.Width
	
	UITextSize.MaxTextSize = 100
	UITextSize.MinTextSize = 1
	
	UIStroke.Thickness = 4
	UIStroke.LineJoinMode = Enum.LineJoinMode.Miter
	
	--GUI
	GUI.Name = "Debug GUI"
	GUI.IgnoreGuiInset = true
	
	--Text
	Text.Name = "Debug"
	Text.TextScaled = true
	Text.BackgroundTransparency = 1
	Text.Text = ""
	Text.TextColor3 = Color3.new(1,1,1)
	Text.Font = Enum.Font.Roboto
	Text.AnchorPoint = Vector2.new(.5,.5)
	--Text.Position = UDim2.new(0.244, 0, 0.087, 0)
	Text.Position = UDim2.new(0.244, 0, -1, 0)
	Text.Size = UDim2.new(0.488, 0 , 0.178, 0)
	Text.TextXAlignment = Enum.TextXAlignment.Left
	Text.RichText = true
end

function XelDebug:Print(print:string)
	Text.Position = UDim2.new(0.244, 0, -1, 0)
	Text.Text = '<font color="rgb(167,225,236)">Print: </font>'..print
	XelTween:Tween(Text,{Position = UDim2.new(0.244, 0, 0.087, 0)},1,{ease = "circOut"})
	XelTween:Tween(Text,{Position = UDim2.new(0.244, 0, -1, 0)},1,{ease = "circIn", startDelay = 1})
end

function XelDebug:Warn(print:string)
	Text.Position = UDim2.new(0.244, 0, -1, 0)
	Text.Text = '<font color="rgb(229,190,98)">Warn: </font>'..print
	XelTween:Tween(Text,{Position = UDim2.new(0.244, 0, 0.087, 0)},1,{ease = "circOut"})
	XelTween:Tween(Text,{Position = UDim2.new(0.244, 0, -1, 0)},1,{ease = "circIn", startDelay = 1})
end

function XelDebug:Error(print:string)
	Text.Position = UDim2.new(0.244, 0, -1, 0)
	Text.Text = '<font color="rgb(229,74,74)">Error: </font>'..print
	XelTween:Tween(Text,{Position = UDim2.new(0.244, 0, 0.087, 0)},1,{ease = "circOut"})
	XelTween:Tween(Text,{Position = UDim2.new(0.244, 0, -1, 0)},1,{ease = "circIn", startDelay = 1})
end

return XelDebug