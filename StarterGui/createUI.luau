local CreateUI = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UIs = ReplicatedStorage.UIs
local A = UIs.A
local B = UIs.B
local UICornerA = A.UICorner
local UIStrokeA = A.UIStroke
local UICornerB = B.UICorner
local UIStrokeB = B.UIStroke

function CreateUI.createUI(name,positionX,positionY,sizeX,sizeY,backgroundTransparency,instance,mode)
	local UI = Instance.new(instance)
	UI.Name = name
	UI.Position = UDim2.new(positionX,0,positionY,0)
	UI.Size = UDim2.new(sizeX,0,sizeY,0)
	UI.BackgroundTransparency = backgroundTransparency
	if mode == "A" then
		local UICornerClone = UICornerA:Clone()
		UICornerClone.Parent = UI
		local UIStrokeClone = UIStrokeA:Clone()
		UIStrokeClone.Parent = UI
	elseif mode == "B" then
		local UICornerClone = UICornerB:Clone()
		UICornerClone.Parent = UI
		local UIStrokeClone = UIStrokeB:Clone()
		UIStrokeClone.Parent = UI
	else
		return UI
	end
	return UI
end

return CreateUI