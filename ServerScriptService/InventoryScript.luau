local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ItemEvent = ReplicatedStorage.ItemEvent
local AddItem = ReplicatedStorage.AddItem
local AnimationEvent = ReplicatedStorage.AnimationEvent
local PlayerPickUp = ReplicatedStorage.PlayerPickUp

local switchingPlayers = {}

Players.PlayerAdded:Connect(function(player)
	local Inventory = Instance.new("Folder")
	Inventory.Name = "Inventory"
	Inventory.Parent = player
	
	player.CharacterAdded:Connect(function()
		switchingPlayers[player] = false
	end)
end)

local function TeleportToPlayer(InventoryItem,rightArm)
	InventoryItem.Parent = rightArm
	local attributes = InventoryItem:FindFirstChild("Attributes")
	local angle = attributes:FindFirstChild("Angle").Value
	local handle = InventoryItem:FindFirstChild("Handle")
	handle.CFrame = (rightArm.CFrame * CFrame.new(0,-1,0)) * CFrame.Angles(math.rad(angle.X),math.rad(angle.Y),math.rad(angle.Z))
	local weldConstraint = Instance.new("WeldConstraint")
	weldConstraint.Name = "ItemWeld"
	weldConstraint.Part0 = rightArm
	weldConstraint.Part1 = handle
	weldConstraint.Parent = rightArm
end

ItemEvent.OnServerEvent:Connect(function(player,equip,itemName)
	if switchingPlayers[player] == true then return end
	switchingPlayers[player] = true
	task.wait(0.1)
	
	local Inventory = player:FindFirstChild("Inventory")
	local InventoryItem = Inventory:FindFirstChild(itemName)
	local character = player.Character
	local rightArm = character:FindFirstChild("Right Arm")

	for _, child in pairs(rightArm:GetChildren()) do
		if child:GetAttribute("IsItem") == true then
			child:Destroy()
		elseif child:IsA("WeldConstraint") and child.Name == "ItemWeld" then
			child:Destroy()
		end
	end
	
	AnimationEvent:FireClient(player,InventoryItem:FindFirstChild("Attributes"):FindFirstChild("Animation").Value,equip)
	
	if equip == true then
		local InventoryItemClone = InventoryItem:Clone()
		TeleportToPlayer(InventoryItemClone,rightArm)
	end
	
	switchingPlayers[player] = false
end)

PlayerPickUp.OnServerInvoke = function(player,item)
	local character = player.Character
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	local distance = (item.PrimaryPart.Position - humanoidRootPart.Position).Magnitude

	if item.Parent.Name ~= "Right Arm" then
		local Inventory = player:FindFirstChild("Inventory")
		if #Inventory:GetChildren() > 8 then return true end
		item.Parent = Inventory
	end
	
	item.PrimaryPart.Anchored = false
	
	local billboardGui = item.PrimaryPart:FindFirstChild("BillboardGui")
	if billboardGui then billboardGui:Destroy() end

	AddItem:FireClient(player,item)
	return true
end