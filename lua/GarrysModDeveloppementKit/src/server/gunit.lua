MsgC(Color(255,0,0),"@GarrysModDeveloppementKit",Color(0,255,0)," LOAD ",Color(255,0,255),"test unitaire\n")
--PrintTable(GarrysModDeveloppementKit)
hook.Add("PlayerInitialSpawn","yeah!",function(player)
    GarrysModDeveloppementKit.Core:network("/demo",{
        message = "Bonjour " .. player:Nick() .. ", voici le code sercet : ",
        code = 42,
        var = 1,
        toBool = true,
        rank = {
            superadmin = {
                autorized = true,
                value = 911
            },
            gg = function() print("yeah") end
        },
        pos = Vector(0,0,0),
        ang = Angle(0,10,0),
        col = Color(255,0,0)
    },player)
end)