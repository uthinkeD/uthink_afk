local lastPos = nil
local afkTimer = 0
local warned = false
local isAFK = false

local function notify(title, desc, type)
    if lib and lib.notify then
        lib.notify({ title = title, description = desc, type = type })
    else
        print(("[%s] %s"):format(title, desc))
    end
end

RegisterNetEvent('esx:playerLoaded', function()
    Wait(3000) -- majhen delay, da vse naloži
    
    lastPos = GetEntityCoords(PlayerPedId())
    
    CreateThread(function()
        while true do
            Wait(1000 * (Config.DebugAFK and 3 or 60)) 
    
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
    
            if #(pos - lastPos) < 0.1 then
                afkTimer = afkTimer + 1
                if Config.DebugAFK then print("[AFK] Timer: " .. afkTimer .. " min") end
            else
                if isAFK then
                    TriggerServerEvent("uthink_afk:left")
                    isAFK = false
                end
                afkTimer = 0
                warned = false
                if Config.DebugAFK then print("[AFK] Movement detected. Resetting.") end
            end
    
            lastPos = pos
    
            local required = Config.DebugAFK and 0.05 or Config.AFKWarningMinutes
            if afkTimer >= required and not warned then
                warned = true
                isAFK = true
                TriggerServerEvent("uthink_afk:entered")
                notify("AFK Warning", Config.WarningMessage, "warning")
    
                CreateThread(function()
                    Wait(Config.KickDelaySeconds * 1000)
                    if #(GetEntityCoords(PlayerPedId()) - lastPos) < 0.1 then
                        TriggerServerEvent("uthink_afk:kick")
                    else
                        afkTimer = 0
                        warned = false
                        isAFK = false
                        TriggerServerEvent("uthink_afk:left")
                        if Config.DebugAFK then print("[AFK] Player moved after warning.") end
                    end
                end)
            end
        end
    end)
end)


if Config.DebugAFK then
    RegisterCommand(Config.AFKCommand or "forceafk", function()
        notify("AFK TEST", "Simulating AFK test", "inform")
        TriggerServerEvent("uthink_afk:entered")
        TriggerServerEvent("uthink_afk:forceafk_triggered") 

        Wait(Config.KickDelaySeconds * 1000)
        TriggerServerEvent("uthink_afk:kick")
    end, false)
end

