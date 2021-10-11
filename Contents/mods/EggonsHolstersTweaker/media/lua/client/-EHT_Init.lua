-- ENABLE EVENTS
if EggonsMU then
    print("Enabling events")
    EggonsMU.config.enableEvent("OnBeforeItemTransfer")
    EggonsMU.config.enableEvent("OnHotbarItemAttach")
    EggonsMU.config.enableEvent("OnHotbarItemUnattach")
else
    print("WARNING! Events not enabled!")
end

EHT = EHT or {}
