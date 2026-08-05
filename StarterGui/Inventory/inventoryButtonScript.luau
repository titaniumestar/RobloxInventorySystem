local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local Inventory = player:FindFirstChild("Inventory")
local inventoryButton = script.Parent
local inventory = inventoryButton.Parent
local ItemEvent = ReplicatedStorage.ItemEvent

local numbers = {"One","Two","Three","Four","Five","Six","Seven","Eight","Nine"}
local inventoryNum = tonumber(string.match(inventoryButton.Name,"%d+"))
local number = numbers[inventoryNum]

local function itemFunction(equip,inventoryNum)
	for _, child in pairs(inventoryButton:GetChildren()) do
		if child:IsA("ImageLabel") then
			local Number = 0
			if equip == true then Number = inventoryNum end
			inventory:SetAttribute("Picking",Number)
			local itemImage = child
			ItemEvent:FireServer(equip,itemImage.Name)
			return
		end
	end
end

local function activated()
	local Picking = inventory:GetAttribute("Picking")
	if inventoryButton:GetAttribute("HasItem") == false then return end
	if Picking > 0 and Picking < 10 and Picking ~= inventoryNum then itemFunction(true,inventoryNum) 
	elseif Picking == inventoryNum then itemFunction(false)
	else itemFunction(true,inventoryNum) end
end

inventoryButton.Activated:Connect(function()
	activated()
end)

UserInputService.InputBegan:Connect(function(input,gameProcessedEvent)
	local keyName = input.KeyCode.Name
	if keyName == number then activated() end
end)