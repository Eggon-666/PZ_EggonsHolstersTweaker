EHT.equipPrimaryHandler = function(player, item)
    if not item then
        EHT.performClothingCheck = true
        return
    end
    local hotbar = getPlayerHotbar(0)
    if item:getAttachmentType() == "Holster" and hotbar:isInHotbar(item) then
        EHT.adjustWeight(item, false, "Equipped primary")
    end
end
Events.OnEquipPrimary.Add(EHT.equipPrimaryHandler)
