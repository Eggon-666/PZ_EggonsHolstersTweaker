EHT.equipPrimaryHandler = function(player, item)
    if not item then
        -- EHT.performClothingCheck = true
        EggonsMU.functions.performActionOnItems(
            EggonsMU.functions.getHotbarItems(),
            function(hotbarItem)
                local weightReduction = EHT.itemsWeightReduction(hotbarItem)
                if weightReduction >= 0 then
                    EHT.adjustWeight(hotbarItem, true, "Unequipped primary", weightReduction)
                end
            end
        )
        return
    end
    local hotbar = getPlayerHotbar(0)
    local weightReduction = EHT.itemsWeightReduction(item)
    if  weightReduction >= 0 and hotbar:isInHotbar(item) then
        EHT.adjustWeight(item, false, "Equipped primary", weightReduction)
    end
end
Events.OnEquipPrimary.Add(EHT.equipPrimaryHandler)
