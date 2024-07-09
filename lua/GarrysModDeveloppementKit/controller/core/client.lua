local Core = { __listener = {} }
function Core:getListener(StringIndex) return self.__listener[StringIndex].isEnable and self.__listener[StringIndex].void end
function Core:setListener(StringIndex,VoidCatch) self.__listener[StringIndex] = { isEnable = true, void = VoidCatch } end
function Core:removeListener(StringIndex) table.RemoveByValue(self.__listener,StringIndex) end
function Core:enableListener(BooleanEnable,StringIndex) self.__listener[StringIndex].isEnable = BooleanEnable end
function Core:request(StringCommand) net.Start("@GarrysModDeveloppementKit::Core=>Controller{$CLIENT}{$PRIVATE}") net.WriteString(StringCommand) net.SendToServer() end

GarrysModDeveloppementKit.Core = setmetatable(Core,{
    __newindex = function(self,key,value) end,
    __call = function(self)
        MsgC(Color(255,0,0),"@GarrysModDeveloppementKit",Color(0,255,255)," CHARGE ",Color(255,0,255),"Controller CLIENT\n")
        net.Receive("@GarrysModDeveloppementKit::Core=>Controller{$SERVER}{$PRIVATE}",function(len)
            self:getListener(net.ReadString())(len)
        end)
    end
})