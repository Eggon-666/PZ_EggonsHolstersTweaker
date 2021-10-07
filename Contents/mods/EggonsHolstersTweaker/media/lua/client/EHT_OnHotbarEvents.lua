EHT.OnHotbarItemAttach = function(itemBeingAttached)
    if not itemBeingAttached then
        return
    end
    local attachment = itemBeingAttached:getAttachmentType()
    if attachment == "Holster" then
        local playerData = getSpecificPlayer(0):getModData()
        EHT.adjustWeight(itemBeingAttached, true)
    end
end
Events.OnHotbarItemAttach.Add(EHT.OnHotbarItemAttach)

EHT.OnHotbarItemUnattach = function(item)
    if EHT.hasInitialData(item) then
        EHT.adjustWeight(item, false, "Unattach")
        EHT.removeInitialDataIfPresent(item)
    end
end
Events.OnHotbarItemUnattach.Add(EHT.OnHotbarItemUnattach)
