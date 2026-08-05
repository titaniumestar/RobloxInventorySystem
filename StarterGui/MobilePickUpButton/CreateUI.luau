local Players = game:GetService("Players")
local player = Players.LocalPlayer

local UserInputService = game:GetService("UserInputService")
local isMobile = UserInputService.TouchEnabled

if isMobile == false then
	script.Parent:Destroy()
	return
end

local MobileAttackButton = script.Parent
local ButtonScript = MobileAttackButton.ButtonScript
local createUI = require(MobileAttackButton.Parent:FindFirstChild("createUI")).createUI

local Button = createUI(
	"TextButton",
	0.85,
	0.2,
	0.075,
	0.15,
	0.5,
	"TextButton",
	"B"
)
Button.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
Button.Text = "ʰȡ"
Button.TextColor3 = Color3.new(0,0,0)
Button.TextScaled = true
Button.TextTransparency = 0.75
Button.TextStrokeColor3 = Color3.new(0,0,0)
Button.TextStrokeTransparency = 0.5
Button.Parent = script.Parent
ButtonScript.Parent = Button
ButtonScript.Enabled = true