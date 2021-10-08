EHT.OnItemTransfer = function(item, srcContainer, destContainer, decision)
    -- print("Transferring item: ", item:getType())
    -- print("To container: ", destContainer)
    -- print("of type: ", destContainer:getType())
    if destContainer:getType() == "none" then
        return
    end

    if EHT.hasInitialData(item) then
        local capacity = destContainer:getCapacity()
        local usedCapacity = destContainer:getContentsWeight()
        local freeCapacity = capacity - usedCapacity
        local itemWeight = EHT.getAndSetItemsInitialWeight(item)

        if itemWeight > freeCapacity then
            decision.cancel = true
            local player = getSpecificPlayer(0)
            player:Say("There's not enough space. This item weights " .. tostring(itemWeight) .. ".")
            return
        end
        EHT.adjustWeight(item, false, "Transfer out")
    end
end

Events.OnAfterItemTransfer.Add(EHT.OnItemTransfer)

