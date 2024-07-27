local Core = { __listener = {}, __networks = {} }
function Core:getListener(StringIndex) return self.__listener[StringIndex].isEnable and self.__listener[StringIndex].void end
function Core:setListener(StringIndex,VoidCatch) self.__listener[StringIndex] = { isEnable = true, void = VoidCatch } end
function Core:removeListener(StringIndex) table.RemoveByValue(self.__listener,StringIndex) end
function Core:enableListener(BooleanEnable,StringIndex) self.__listener[StringIndex].isEnable = BooleanEnable end
function Core:request(StringCommand,who) 
    net.Start("@GarrysModDeveloppementKit::Core=>Controller{$SERVER}{$PRIVATE}") 
        net.WriteString(StringCommand)
    net.Send(who)
end
function Core:network(StringCommand,TableArguments,who,BooleanIsForAllClients)
    local package = "@"
    for key,value in pairs(TableArguments) do
        package = package .. key .. "$" .. value .. "@"
    end
    package = util.Compress(package)
    local size = #package
    net.Start("@GarrysModDeveloppementKit::Core=>Controller{$SERVER}{$PRIVATE}")
        net.WriteString(StringCommand)
        net.WriteUInt(size,16)
        net.WriteData(package,size)
    Either(BooleanIsForAllClients,net.Broadcast(),net.Send(who))
end
function Core:read()
    local data,args = util.Decompress(net.ReadData(net.ReadUInt(16))), {}
    for _, data in ipairs(string.Split(data,"@")) do
        if (#data == 0) then continue end
        local decompile = string.Split(data,"$")
        args[decompile[1]] = decompile[2]
    end
    self.__networks = args
    return args
end
function Core:get(StringKey)
    return self.__networks[StringKey] or "@GarrysModDeveloppementKit::Core=>Controller>>>{$"..StringKey.."} is null"
end
GarrysModDeveloppementKit.Core = setmetatable(Core,{
    __newindex = function(self,key,value) end,
    __call = function(self)
        MsgC(Color(255,0,0),"@GarrysModDeveloppementKit",Color(0,255,255)," CHARGE ",Color(255,0,255),"Controller SERVER\n")
        net.Receive("@GarrysModDeveloppementKit::Core=>Controller{$CLIENT}{$PRIVATE}",function(len)
            self:getListener(net.ReadString())(len)
        end)
        net.Receive("@GarrysModDeveloppementKit::Core=>Controller{$CLIENT}{$ASYNC}",function(len,ply)
            ARGS = net.ReadTable()
            RESULT = {}
            RunString(net.ReadString())
            net.Start("@GarrysModDeveloppementKit::Core=>Controller{$CLIENT}{$ASYNC::RETURN}")
                net.WriteTable(RESULT)
                net.WriteString(net.ReadString())
            Either(net.ReadBool(),net.Broadcast(),net.Send(ply))
            ARGS = nil 
            RESULT = nil
        end)
    end
})