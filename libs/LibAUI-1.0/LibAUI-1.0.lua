local MAJOR, MINOR = "LibAUI-1.0", 1
assert(LibStub, MAJOR.." requires LibStub")
local lib, minor = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then return end

local EventFrame = CreateFrame('Frame')
     
    EventFrame:RegisterEvent('PLAYER_LOGIN')
     
    EventFrame:SetScript('OnEvent',function(self, event_name, ...)
            local func = self[event_name]
            if func then
                    func(self, ...)  -- I don't think you need the event_name -- you already know what it is -- it's the name of the function!
            else
                    -- If you don't have a function EventFrame:EVENT_NAME() then it errors to
                    -- let you know you forgot to define it (see below, "events").
                    error(('could not find function for `%s`: forgot to define?'):format(event_name))
            end
    end)     
