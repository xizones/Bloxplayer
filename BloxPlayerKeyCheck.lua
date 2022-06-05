local funcs = {}

function funcs.OnKeySent(c)
	return c
end

-- Gui to Lua
-- Version: 3.2

-- Instances:

local KeyCheck = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local UICorner_2 = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local TextButton = Instance.new("TextButton")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

--Properties:

KeyCheck.Name = "KeyCheck"
KeyCheck.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = KeyCheck
Frame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.405208349, 0, 0.364814818, 0)
Frame.Size = UDim2.new(0.189583331, 0, 0.270370364, 0)

TopBar.Name = "TopBar"
TopBar.Parent = Frame
TopBar.BackgroundColor3 = Color3.fromRGB(31, 202, 94)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0.126712322, 0)

UICorner.Parent = TopBar

Frame_2.Parent = TopBar
Frame_2.BackgroundColor3 = Color3.fromRGB(31, 202, 94)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0, 0, 0.721367896, 0)
Frame_2.Size = UDim2.new(1, 0, 0.270270258, 0)

TextLabel.Parent = TopBar
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(-0.00202790974, 0, 0, 0)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.SourceSansSemibold
TextLabel.Text = "Enter Spotify API key"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

UITextSizeConstraint.Parent = TextLabel
UITextSizeConstraint.MaxTextSize = 37

UICorner_2.Parent = Frame

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.0543665625, 0, 0.246575341, 0)
TextBox.Size = UDim2.new(0.887362659, 0, 0.291095883, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Key"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.TextSize = 29.000
TextBox.TextWrapped = true

UITextSizeConstraint_2.Parent = TextBox
UITextSizeConstraint_2.MaxTextSize = 29

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.0351357944, 0, 0.678082228, 0)
TextButton.Size = UDim2.new(0.928571403, 0, 0.239726022, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Enter API key"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 51.000
TextButton.TextWrapped = true
TextButton.MouseButton1Click:Connect(function()
	funcs.OnKeySent(TextBox.Text)
end)
UITextSizeConstraint_3.Parent = TextButton
UITextSizeConstraint_3.MaxTextSize = 51

UIAspectRatioConstraint.Parent = Frame
UIAspectRatioConstraint.AspectRatio = 1.247

-- Scripts:

local function FLDF_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local Drag = script.Parent
	gsCoreGui = game:GetService("CoreGui")
	gsTween = game:GetService("TweenService")
	local UserInputService = game:GetService("UserInputService")
	local dragging
	local dragInput
	local dragStart
	local startPos
	local function update(input)
		local delta = input.Position - dragStart
		local dragTime = 0.04
		local SmoothDrag = {}
		SmoothDrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		local dragSmoothFunction = gsTween:Create(Drag, TweenInfo.new(dragTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), SmoothDrag)
		dragSmoothFunction:Play()
	end
	Drag.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = Drag.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	Drag.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging and Drag.Size then
			update(input)
		end
	end)
	
end
coroutine.wrap(FLDF_fake_script)()


return funcs
