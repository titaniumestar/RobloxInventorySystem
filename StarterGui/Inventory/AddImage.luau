local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local inventory = script.Parent
local AddItem = ReplicatedStorage.AddItem

local function addImage(item)
	for count = 1,9 do
		local inventoryButton = inventory:FindFirstChild("Inventory"..tostring(count))
		if not inventoryButton then return end
		
		if inventoryButton:GetAttribute("HasItem") == false then
			inventoryButton:SetAttribute("HasItem",true)
			for _, child in pairs (item:GetChildren()) do
				if child:IsA("ImageLabel") then
					local image = child:Clone()
					image.Parent = inventoryButton
					return
				end
			end
		end
	end
end

AddItem.OnClientEvent:Connect(function(item)
	addImage(item)
end)