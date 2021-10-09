EHT.OnHotbarItemAttach = function(itemBeingAttached, slot, slotIndex, slotDef, doAnim)
    -- itemBeingAttached = eventData.item
    if not itemBeingAttached then
        return
    end
    local attachment = itemBeingAttached:getAttachmentType()
    local weightReduction = EHT.itemsWeightReduction(itemBeingAttached)
    if weightReduction >= 0 then
        local playerData = getSpecificPlayer(0):getModData()
        EHT.adjustWeight(itemBeingAttached, true, "Attach", weightReduction)
    end
end
-- Events.OnHotbarItemAttach.Add(EHT.OnHotbarItemAttach)
-- Events.OnHotbarItemAttach.Add(function() print("Attached OLD") end)
Events.OnHotbarItemAttach.Add(EHT.OnHotbarItemAttach)

EHT.OnHotbarItemUnattach = function(item)
    -- local item = eventData.item
    if EHT.hasInitialData(item) then
        EHT.adjustWeight(item, false, "Unattach") -- WR not needed for unattach
        EHT.removeInitialDataIfPresent(item)
    end
end
Events.OnHotbarItemUnattach.Add(EHT.OnHotbarItemUnattach)
