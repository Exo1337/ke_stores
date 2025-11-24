local ESX = exports[Config.Framework]:getSharedObject()

function GetItemImage(itemName)
    return ('nui://qs-inventory/html/images/%s.png'):format(itemName)
end

function GetItemsForCategory(categoryName)
    local items = {}
    local categoryItems = Config.Categories[categoryName]
    
    if not categoryItems then
        return items
    end
    
    for _, item in ipairs(categoryItems) do
        table.insert(items, {
            label = item.label,
            name = item.name,
            price = item.price,
            imageUrl = GetItemImage(item.name)
        })
    end
    
    return items
end

function Draw3DText(coords, text)
    SetDrawOrigin(coords.x, coords.y, coords.z, 0)
    
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetTextCentre(true)
    SetTextFont(4)
    SetTextScale(0.35, 0.35)
    EndTextCommandDisplayText(0.0, 0.0)
    
    BeginTextCommandGetWidth("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetTextFont(4)
    SetTextScale(0.35, 0.35)
    
    local textWidth = EndTextCommandGetWidth(true)
    local width = textWidth + 0.0015
    local height = GetRenderedCharacterHeight(0.35, 4) * 1.3
    
    DrawRect(0.0, height / 2, width, height, 45, 45, 45, 150)
    ClearDrawOrigin()
end

function LoadAnimDict(dict)
    if not DoesAnimDictExist(dict) then
        return false
    end
    
    if HasAnimDictLoaded(dict) then
        return true
    end
    
    RequestAnimDict(dict)
    local timeout = GetGameTimer() + 5000
    
    while not HasAnimDictLoaded(dict) and GetGameTimer() < timeout do
        Wait(10)
    end
    
    return HasAnimDictLoaded(dict)
end

function PlayAnimation(ped, dict, anim, flag)
    if not IsEntityPlayingAnim(ped, dict, anim, 3) then
        if LoadAnimDict(dict) then
            TaskPlayAnim(ped, dict, anim, 2.0, -1.0, -1, flag or 49, 0, false, false, false)
        end
    end
end

function GetPlayerDistanceFromCoords(coords)
    return #(GetEntityCoords(PlayerPedId()) - coords)
end

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    if cb then cb('ok') end
end)

RegisterNUICallback('buy', function(data, cb)
    TriggerServerEvent("exo_shops:pay", data)
    Stores:ClearCart()
    if cb then cb('ok') end
end)

RegisterNUICallback("exit", function(data, cb)
    SetNuiFocus(false, false)
    Stores.inMenu = false
    if cb then cb('ok') end
end)

RegisterNUICallback("openPaymentConfirmed", function(data, cb)
    Stores.inMenu = true
    SetNuiFocus(true, true)
    if cb then cb('ok') end
end)

RegisterNUICallback("cartEmpty", function(data, cb)
    ESX.ShowNotification("Du måste lägga till produkter i varukorgen innan du kan betala.")
    if cb then cb('ok') end
end)
