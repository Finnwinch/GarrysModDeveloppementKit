MsgC(Color(255,0,0),"@GarrysModDeveloppementKit",Color(0,255,0)," LOAD ",Color(255,0,255),"test unitaire\n")
GarrysModDeveloppementKit.Core:setListener("/demo",function(len)
    local args = GarrysModDeveloppementKit.Core:read()
    PrintTable(args)
    print(GarrysModDeveloppementKit.Core:get("code"))
    print(GarrysModDeveloppementKit.Core:get("rank.superadmin.value"))
    print(len)
end)