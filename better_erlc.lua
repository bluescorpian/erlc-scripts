local CoreGui = game:GetService("StarterGui")

-- stamina unlock
loadstring(game:HttpGet("https://raw.githubusercontent.com/bluescorpian/erlc-scripts/main/fill_stamina_unlock.lua"))()
CoreGui:SetCore("SendNotification", {
    Title = "Hack Loaded",
    Text = "Stamina Unlock Loaded"
})
loadstring(game:HttpGet("https://raw.githubusercontent.com/bluescorpian/erlc-scripts/main/instant_refuel_unlock_v2.lua"))()
CoreGui:SetCore("SendNotification", {
    Title = "Hack Loaded",
    Text = "Instant Refuel Unlock Loaded"
})
loadstring(game:HttpGet("https://raw.githubusercontent.com/bluescorpian/erlc-scripts/main/better_interact.lua"))()
CoreGui:SetCore("SendNotification", {
    Title = "Hack Loaded",
    Text = "Better Interactions Loaded"
})