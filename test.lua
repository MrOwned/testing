-- Meta Variables
print("Assets loaded, block thingy now is launched.")
local Player = game.Players.LocalPlayer
local mouse = Player:GetMouse()
local SG = Instance.new("ScreenGui", game:GetService("CoreGui"))
local UserInputService = game:GetService("UserInputService")
local InteractKeyBind = Enum.KeyCode.R -- CHANGE [R] TO ANY KEY YOU WANT!

-- Global Var Library
local Enabled = false

UserInputService.InputBegan:connect(function(input, processed)
	if input.KeyCode == InteractKeyBind and not processed then -- Checks to see if the player is typing so the function won't just work!
        if Enabled == false then
            Enabled = true
            warn("block_state: true")
        else
            Enabled = false
            warn("block_state: false")
        end
	end
end)

-- Main Handler
Player.Character.HumanoidRootPart.ChildAdded:connect(function(kid)
	if kid:IsA("BodyVelocity") and Enabled == true then
        game.Debris:AddItem(kid,0)
        print("Blocked: " .. kid.name)
	end
end)
