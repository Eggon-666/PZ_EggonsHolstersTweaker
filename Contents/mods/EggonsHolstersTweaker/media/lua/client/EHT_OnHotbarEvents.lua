EHT.OnHotbarItemAttach = function(itemBeingAttached, slot, slotIndex, slotDef, doAnim)
    if not itemBeingAttached then
        return
    end
    local weightReduction = EHT.itemsWeightReduction(itemBeingAttached)
    if weightReduction >= 0 then
        EHT.adjustWeight(itemBeingAttached, true, "Attach", weightReduction)
    end
    -- print("Is in hotbar item being attached? ", getPlayerHotbar(0).isInHotbar(itemBeingAttached))
    local hotbar = getPlayerHotbar(0)
    local replacedItem = hotbar.attachedItems[slotIndex]
    if replacedItem and EHT.hasInitialData(replacedItem) then
        EHT.adjustWeight(replacedItem, false, "Replace")
    end
end
Events.OnHotbarItemAttach.Add(EHT.OnHotbarItemAttach)

EHT.OnHotbarItemUnattach = function(item)
    if EHT.hasInitialData(item) then
        EHT.adjustWeight(item, false, "Unattach") -- WR not needed for unattach
        EHT.removeInitialDataIfPresent(item)
    end
end
Events.OnHotbarItemUnattach.Add(EHT.OnHotbarItemUnattach)
