# RobloxInventorySystem
Luau script

It originated from my roblox game *Unnamed Battle Game*
https://www.roblox.com/games/131526004425694

Folder Names Correspond to Container Locations in Roblox

Just Place the Scripts Into Their Matching Folders

ReplicatedStorage:

- PlayerPickUp (RemoteFunction)
- AddItem (RemoteEvent)
- AnimationEvent (RemoteEvent)
- ItemEvent (RemoteEvent)

Item Structure Dependency:

Item (Model) | Attribute: IsItem = true
- Attributes (Folder)
  - Angle (Vector3Value)
  - Animation (StringValue) | Value is Animation Name
- Handle (Part) | Must be PrimaryPart of Item
- Icon (ImageLabel)

StartGui/Inventory and StartGui/MobilePickUpButton Should be ScreenGui

StartGui/Inventory/inventoryButtonScript and StartGui/MobilePickUpButton/ButtonScript Should not be Enabled Initial

StarterPlayer/StarterCharacterScripts/Animation Should has Child Object of Animation
