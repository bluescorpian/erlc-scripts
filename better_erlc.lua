local CoreGui = game:GetService("StarterGui")

local exploits = {
{"Fill Stamina Unlock", "https://raw.githubusercontent.com/bluescorpian/erlc-scripts/main/fill_stamina_unlock.lua"},
{"Instant Refuel Unlock", "https://raw.githubusercontent.com/bluescorpian/erlc-scripts/main/instant_refuel_unlock_v2.lua"},
{"Better Interactions", "https://raw.githubusercontent.com/bluescorpian/erlc-scripts/main/better_interact.lua"}
}

for _, exploit in pairs(exploits) do
    loadstring(game:HttpGet(exploit[2]))()
    CoreGui:SetCore("SendNotification", {
        Title = "Exploit Loaded",
        Text = exploit[1]
    })
end