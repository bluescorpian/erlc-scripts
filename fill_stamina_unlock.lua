local utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/bluescorpian/missingPieceUtils/main/missingPieceUtils.lua"))()

local LocalPlayer = game:GetService("Players").LocalPlayer
local FE = game:GetService("ReplicatedStorage"):WaitForChild("FE");

function onSpawn()
    local health = LocalPlayer.PlayerGui:WaitForChild("GameGui").BottomLeft.Health
    local fillStaminaButton = health.Stamina:WaitForChild("Fill")
    
    -- try 30 times to see if event listener has been added and wait 1s
    local success, attempts = utils.retryUntil(function() return #getconnections(fillStaminaButton.MouseButton1Down) ~= 0 end, 15, 2.5)
    if not success then
        error("Stamina never ran")
    end
    
    local fillStaminaClick = getconnections(fillStaminaButton.MouseButton1Down)[1].Function
    
    hookfunction(fillStaminaClick, function()
        firesignal(FE.FillStaminaBought.OnClientEvent)
    end)
end
onSpawn()
LocalPlayer.CharacterAdded:Connect(onSpawn)