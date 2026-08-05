local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local pickUpEvent = ReplicatedStorage:WaitForChild("PlayerPickUp")
local Button = script.Parent

local pickingUp = false

Button.Activated:Connect(function()
	if pickingUp == true then return end
	pickingUp = true
	
	local overlapParams = OverlapParams.new()
	overlapParams.FilterType = Enum.RaycastFilterType.Exclude
	overlapParams.FilterDescendantsInstances = {character}

	local parts = Workspace:GetPartBoundsInRadius(humanoidRootPart.Position,9,overlapParams)

	local item = nil
	
	for _, part in ipairs(parts) do
		local gotParent = part.Parent
		if gotParent:GetAttribute("IsItem") == true and gotParent.Parent.Name ~= "Right Arm" then
			item = gotParent
			break
		end
	end
	
	if not item then
		pickingUp = false
		return
	end

	local result = pickUpEvent:InvokeServer(item)

	if result == true then
		pickingUp = false
	end
end)