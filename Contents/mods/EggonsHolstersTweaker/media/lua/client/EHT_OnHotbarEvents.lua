EHT.OnHotbarItemAttach = function(eventData)
    itemBeingAttached = eventData.item
    if not itemBeingAttached then
        return
    end
    local attachment = itemBeingAttached:getAttachmentType()
    if attachment == "Holster" then
        local playerData = getSpecificPlayer(0):getModData()
        EHT.adjustWeight(itemBeingAttached, true)
    end
end
-- Events.OnHotbarItemAttach.Add(EHT.OnHotbarItemAttach)
-- Events.OnHotbarItemAttach.Add(function() print("Attached OLD") end)
Events.OnHotbarItemAttached.Add(EHT.OnHotbarItemAttach)

EHT.OnHotbarItemUnattach = function(eventData)
    local item = eventData.item
    if EHT.hasInitialData(item) then
        EHT.adjustWeight(item, false, "Unattach")
        EHT.removeInitialDataIfPresent(item)
    end
end
Events.OnHotbarItemUnattach.Add(EHT.OnHotbarItemUnattach)
Events.OnHotbarItemUnattach.Add(function() print("DETACHED OLD") end)
Events.OnHotbarItemDetached.Add(function() print("DETACHED NEW") end)
