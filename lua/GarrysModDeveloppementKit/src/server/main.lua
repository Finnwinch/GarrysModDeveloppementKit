MsgC(Color(255,0,0),"@GarrysModDeveloppementKit",Color(0,255,0)," LOAD ",Color(255,0,255),"script\n")
hook.Add("PlayerInitialSpawn","init interface",function(ply)
    GarrysModDeveloppementKit.Core:request("OpenInterfaceWhenPlayerSpawn",ply)
end)