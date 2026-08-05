local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local inventory = script.Parent
local inventoryButtonScript = inventory.inventoryButtonScript
local createUI = require(inventory.Parent:FindFirstChild("createUI")).createUI

local function createInventory(count)
	local Button = createUI(
		"Inventory"..tostring(count),
		0.025 + (0.075 * (count - 1)),
		0.875,
		0.075,
		0.125,
		0.5,
		"ImageButton",
		"A"
	)
	Button:SetAttribute("HasItem",false)
	Button.Parent = inventory
	local Number = createUI(
		"Number",
		0,
		0.025,
		0.2,
		0.2,
		1,
		"TextLabel"
	)
	Number.Text = count
	Number.TextColor3 = Color3.new(1,1,1)
	Number.TextScaled = true
	Number.ZIndex = 2
	Number.Parent = Button
	local inventoryButtonScriptClone = inventoryButtonScript:Clone()
	inventoryButtonScriptClone.Enabled = true
	inventoryButtonScriptClone.Parent = Button
end

for count = 1,9 do
	createInventory(count)
end

inventory:SetAttribute("Picking",0)