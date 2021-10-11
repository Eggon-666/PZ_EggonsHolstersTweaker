EHT.OnHotbarItemAttach = function(itemBeingAttached, slot, slotIndex, slotDef, doAnim)
    if not itemBeingAttached then
        return
    end
    local weightReduction = EHT.itemsWeightReduction(itemBeingAttached)
    if weightReduction >= 0 then
        EHT.adjustWeight(itemBeingAttached, true, "Attach", weightReduction)
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
