Config = {}

Config.AFKWarningMinutes = 3 -- ⏱ Time (in minutes) before showing AFK warning
 
Config.KickDelaySeconds = 2 -- ⌛ Time (in seconds) after warning before kicking the player
 
Config.DebugAFK = true -- 🐞 Debug mode (true = enables console debug info and allows manual AFK test command)
Config.AFKCommand = "forceafk" -- 💬 Command used to manually trigger AFK test (only works when DebugAFK is set to true)
Config.Webhook = "https://discord.com/api/webhooks/..." -- Your Discord webhook URL for sending AFK log messages (enter, leave, kick, afkcommand)



Config.WarningMessage = "You have been marked as AFK. If you don't move, you will be kicked." -- ⚠️ Message shown to player when AFK warning is triggered

Config.KickReason = "You were AFK for too long." -- ❌ Reason shown to player when they are kicked




