# RobloxInventorySystem
Luau script

It originated from my roblox game *Unnamed Battle Game*
https://www.roblox.com/games/131526004425694

ReplicatedStorage:

- PlayerPickUp (RemoteFunction)
- AddItem (RemoteEvent)
- AnimationEvent (RemoteEvent)
- ItemEvent (RemoteEvent)

Item Structure Dependency:

Item (Model)
- Attributes (Folder)
  - Angle (Vector3Value)
  - Animation (StringValue) | Value is Animation Name
- Handle (Part) | Must be PrimaryPart of Item
- Icon (ImageLabel)

StartGui/Inventory and StartGui/MobilePickUpButton Should be ScreenGui

StarterPlayer/StarterCharacterScripts/Animation Should has Child Object of Animation
