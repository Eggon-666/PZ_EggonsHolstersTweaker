local BeltAttachments = {
    Hammer = true,
    Screwdriver = true,
    Knife = true,
	HammerRotated = true,
	Nightstick = true,
	Screwdriver  = true,
	Wrench = true,
	MeatCleaver = true,
	Walkie = true
}

EHT.itemsWeightReduction = function(item)
    local attachment = item:getAttachmentType()
    if  attachment == "Holster" then
        return EHT.holsterWeightReduction
    else if BeltAttachments[attachment] then
        return EHT.beltWeightReduction
    end
    return false
end

EHT.adjustWeight = function(item, decrease, trigger)
    trigger = trigger or ""
    local weight = EHT.getAndSetItemsInitialWeight(item)
    if decrease then
        weight = weight / 0.7 * ((100 - EHT.holsterWeightReduction) / 100)
    else
        weight = item:getModData().EHT.initialWeight
    end
    -- print(trigger .. ", adjusting weight from:  ", item:getActualWeight(), "  to:  ", weight)
    item:setActualWeight(weight)
end

EHT.hasInitialData = function(item)
    if not item then
        return false
    end
    if item:getModData().EHT and item:getModData().EHT.initialWeight then
        return true
    else
        return false
    end
end

EHT.getAndSetItemsInitialWeight = function(item)
    local weight
    if item:getModData().EHT then
        weight = item:getModData().EHT.initialWeight or item:getWeight()
    else
        weight = item:getWeight()
        item:getModData().EHT = {initialWeight = weight}
    end
    return weight
end

EHT.removeInitialDataIfPresent = function(item)
    if EHT.hasInitialData(item) then
        item:getModData().EHT = nil
    end
end
