local Config = Config or {}

local function logDiscord(webhook, title, message, color)
    if not webhook or webhook == "" then
        print("[AFK Discord Log] " .. title .. ": " .. message)
        return
    end

    PerformHttpRequest(webhook, function(err, text, headers)
        if err ~= 204 and err ~= 200 then
            print("[AFK Discord Log] ❌ Webhook failed: " .. tostring(err))
        else
            print("[AFK Discord Log] ✅ Sent to Discord")
        end
    end, "POST", json.encode({
        username = "AFK Logger",
        embeds = {{
            title = title,
            description = message,
            color = color or 16711680 -- rdeča po defaultu
        }}
    }), { ["Content-Type"] = "application/json" })
end

local function getIdentity(source)
    if ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            return xPlayer.getName() or ("Player#" .. source), xPlayer.identifier or "No ID"
        end
    end
    return "Player#" .. source, "No ID"
end

RegisterNetEvent("uthink_afk:entered", function()
    local src = source
    local name, discord = getIdentity(src)
    logDiscord(Config.Webhook, "🚶 Player went AFK", ("**%s** (%s) entered AFK mode."):format(name, discord))
    if Config.DebugAFK then
        print(("[AFK] %s (%d) entered AFK."):format(name, src))
    end
end)

RegisterNetEvent("uthink_afk:left", function()
    local src = source
    local name, discord = getIdentity(src)
    logDiscord(Config.Webhook, "🏃 Player left AFK", ("**%s** (%s) left AFK mode."):format(name, discord))
    if Config.DebugAFK then
        print(("[AFK] %s (%d) left AFK."):format(name, src))
    end
end)

RegisterNetEvent("uthink_afk:kick", function()
    local src = source
    local name, discord = getIdentity(src)
    logDiscord(Config.Webhook, "⛔ AFK Kick", ("**%s** (%s) was kicked for being AFK."):format(name, discord))
    if Config.DebugAFK then
        print(("[AFK] %s (%d) was kicked for being AFK."):format(name, src))
    end
    DropPlayer(src, "You were kicked for being AFK.")
end)

RegisterNetEvent("uthink_afk:forceafk_triggered", function()
    local src = source
    local name, discord = getIdentity(src)
    logDiscord(Config.Webhook, "⚙️ AFK Test", ("Player **%s** (%s) triggered an AFK test (%s command)."):format(name, discord, Config.AFKCommand or "unknown"))
    if Config.DebugAFK then
        print(("[AFK TEST] %s (%d) triggered %s command."):format(name, src, Config.AFKCommand or "unknown"))
    end
end)

