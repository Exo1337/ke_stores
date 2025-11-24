local ESX = exports[Config.Framework]:getSharedObject()
Stores = {
    hasBasket = false,
    inMenu = false,
    items = {},
    entity = nil
}

function Stores:Init()
    self:CreateBlips()
    self:StartMainLoop()
end

function Stores:CreateBlips()
    for _, store in ipairs(Config.Stores) do
        for _, coords in ipairs(store.coords) do
            local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
            
            SetBlipSprite(blip, store.blipSprite)
            SetBlipScale(blip, store.blipscale or 0.8)
            SetBlipColour(blip, store.blipColor)
            SetBlipAsShortRange(blip, true)
            
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(store.name)
            EndTextCommandSetBlipName(blip)
        end
    end
end

function Stores:StartMainLoop()
    CreateThread(function()
        while true do
            local sleep = 1500
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            
            for _, store in ipairs(Config.Stores) do
                sleep = self:HandleStoreInteractions(store, playerPed, playerCoords, sleep)
            end
            
            Wait(sleep)
        end
    end)
end

function Stores:HandleStoreInteractions(store, playerPed, playerCoords, sleep)
    for _, coords in ipairs(store.coords) do
        local distance = GetPlayerDistanceFromCoords(coords)
        
        if distance < Config.InteractionDistance then
            sleep = 0
            
            local text = self.hasBasket and '[~g~E~s~] - Lägg tillbaka korgen' or '[~g~E~s~] - Ta en korg'
            Draw3DText(coords, text)
            
            if distance < 1.0 and IsControlJustReleased(0, 38) then
                if self.hasBasket then
                    self:ClearCart()
                else
                    self:TakeBasket()
                end
            end
        end
    end
    
    for _, cashierCoords in ipairs(store.cashierCoords) do
        local distance = GetPlayerDistanceFromCoords(cashierCoords)
        
        if distance < Config.CashierDistance and not self.inMenu then
            sleep = 0
            
            Draw3DText(cashierCoords, '[~g~E~s~] - Kassa')
            
            if distance < 1.0 and IsControlJustReleased(0, 38) then
                if self.hasBasket then
                    SendNUIMessage({type = 'checkCart'})
                else
                    ESX.ShowNotification("Du måste hämta en varukorg innan du kan betala.")
                end
            end
        end
    end
    
    for _, categoryData in ipairs(store.varor) do
        for _, itemCoords in ipairs(categoryData.coords) do
            local distance = GetPlayerDistanceFromCoords(itemCoords)
            
            if distance < Config.InteractionDistance then
                sleep = 0
                
                Draw3DText(itemCoords, '[~g~E~s~] - ' .. categoryData.category)
                
                if distance < 1.0 and IsControlJustReleased(0, 38) then
                    if self.hasBasket then
                        self:OpenCategoryMenu(store, categoryData.category)
                    else
                        ESX.ShowNotification("Du måste hämta en varukorg innan du kan plocka på dig varor.")
                    end
                end
            end
        end
    end
    
    return sleep
end

function Stores:OpenCategoryMenu(store, category)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = 'store',
        data = {
            items = GetItemsForCategory(category),
            shopInfo = {
                name = store.name,
                logo = store.logo,
                category = category
            }
        }
    })
end

function Stores:TakeBasket()
    local playerPed = PlayerPedId()
    
    self.hasBasket = true
    self.entity = CreateObject(GetHashKey('prop_varukorg_01'), GetEntityCoords(playerPed), true, true, true)
    
    AttachEntityToEntity(
        self.entity,
        playerPed,
        GetPedBoneIndex(playerPed, 57005),
        0.51, -0.20, 0.00,
        25.0, 270.0, 180.0,
        true, true, false, true, 1, true
    )
    
    SetModelAsNoLongerNeeded('prop_varukorg_01')
    SendNUIMessage({type = 'setBasket', hasBasket = true})
    
    self:StartBasketThread()
end

function Stores:StartBasketThread()
    CreateThread(function()
        local playerPed = PlayerPedId()
        
        while self.hasBasket do
            if self:IsPlayerTooFarFromStore() then
                ESX.ShowNotification('Du kan ju inte sno varorna?')
                SetPedToRagdoll(playerPed, 1000, 1000, 0, false, false, false)
                self:ClearCart()
                break
            end
            
            PlayAnimation(playerPed, 'anim@heists@narcotics@trash', 'walk', 49)
            Wait(100)
        end
    end)
end

function Stores:IsPlayerTooFarFromStore()
    local playerCoords = GetEntityCoords(PlayerPedId())
    
    for _, store in ipairs(Config.Stores) do
        for _, coords in ipairs(store.coords) do
            if #(playerCoords - coords) <= Config.MaxCartDistance then
                return false
            end
        end
    end
    
    return true
end

function Stores:ClearCart()
    self.hasBasket = false
    self.inMenu = false
    self.items = {}
    
    if self.entity then
        DetachEntity(self.entity, true, true)
        DeleteEntity(self.entity)
        self.entity = nil
    end
    
    local playerPed = PlayerPedId()
    ClearPedTasks(playerPed)
    SetNuiFocus(false, false)
    
    SendNUIMessage({type = 'clear'})
    SendNUIMessage({type = 'setBasket', hasBasket = false})
end

CreateThread(function()
    Stores:Init()
end)
