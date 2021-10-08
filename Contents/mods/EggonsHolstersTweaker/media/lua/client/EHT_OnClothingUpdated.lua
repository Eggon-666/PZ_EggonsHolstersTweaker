EHT.OnClothingUpdated = function()
    if EHT.performClothingCheck then
        EggonsMU.functions.performActionOnItems(
            EggonsMU.functions.getHotbarItems(),
            function(item)
                if item:getAttachmentType() == "Holster" then
                    EHT.adjustWeight(item, true, "Unequipped primary")
                end
            end
        )
        EHT.performClothingCheck = false
    end
end
Events.OnClothingUpdated.Add(EHT.OnClothingUpdated)