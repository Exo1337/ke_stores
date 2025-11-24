local ESX = exports[Config.Framework]:getSharedObject()

local function CalculateTotalPrice(items)
    local total = 0
    for _, item in ipairs(items) do
        total = total + (item.quantities * item.price)
    end
    return math.ceil(total)
end

local function ProcessPayment(xPlayer, validItems, totalPrice, source)
    local cash = xPlayer.getMoney()
    local bank = xPlayer.getAccount("bank").money
    
    if cash >= totalPrice then
        xPlayer.removeMoney(totalPrice)
        TriggerClientEvent('esx:showNotification', source, 'Du har betalat ' .. totalPrice .. ' kr (Kontant)')
        return true
    elseif bank >= totalPrice then
        xPlayer.removeAccountMoney("bank", totalPrice)
        TriggerClientEvent('esx:showNotification', source, 'Du har betalat ' .. totalPrice .. ' kr (Kort)')
        return true
    else
        TriggerClientEvent('esx:showNotification', source, "Du har inte tillräckligt med pengar")
        return false
    end
end

local function AddItemsToInventory(xPlayer, items)
    for _, item in ipairs(items) do
        xPlayer.addInventoryItem(item.name, item.quantities)
    end
end

RegisterNetEvent('exo_shops:pay', function(data)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then return end
    if not data or not data.items then return end

    local items = data.items

    if type(items) ~= "table" or #items == 0 then
        TriggerClientEvent('esx:showNotification', source, 'Inga giltiga varor att köpa.')
        return
    end

    for _, item in ipairs(items) do
        if not item.name or not item.price or not item.quantities then
            TriggerClientEvent('esx:showNotification', source, 'Felaktig vara i beställningen.')
            return
        end
    end

    local totalPrice = CalculateTotalPrice(items)

    if ProcessPayment(xPlayer, items, totalPrice, source) then
        AddItemsToInventory(xPlayer, items)
    end
end)