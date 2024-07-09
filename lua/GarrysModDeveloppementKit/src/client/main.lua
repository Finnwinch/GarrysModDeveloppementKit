MsgC(Color(255,0,0),"@GarrysModDeveloppementKit",Color(0,255,0)," LOAD ",Color(255,0,255),"script\n")
GarrysModDeveloppementKit.Core:setListener("OpenInterfaceWhenPlayerSpawn",function(len)
    local dframe = vgui.Create("DFrame")
    dframe:SetSize(GarrysModDeveloppementKit.Screen.ResponsiveWide(700),GarrysModDeveloppementKit.Screen.ResponsiveTall(400))
    dframe:Center()
    dframe:MakePopup()
    dframe:SetTitle(GarrysModDeveloppementKit.String.AddonsName.." #"..len)
    local async = vgui.Create("DButton",dframe)
    async:SetSize(GarrysModDeveloppementKit.Screen.ResponsiveWide(100),GarrysModDeveloppementKit.Screen.ResponsiveTall(50))
    async:Center()
    async:SetText("Async request")
    async.DoClick = function()
        GarrysModDeveloppementKit.Core:async({
            WINDOWS = dframe,
            BUTTON = async
        },{
            MessageOne = "ok boomer"
        },[[
            if ARGS.MessageOne == "ok boomer" then print("lol") end
            RESULT.Final = "merci"
            return
        ]],[[
            STATIC.WINDOWS.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,w,h,GarrysModDeveloppementKit.Colors.Success)
            end
            STATIC.BUTTON:SetEnabled(false)
            STATIC.BUTTON.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,w,h,GarrysModDeveloppementKit.Colors.Danger)
            end
            STATIC.BUTTON:SetTextColor(GarrysModDeveloppementKit.Colors.Dark)
            print(RESULT.Final)
            timer.Simple(3,function()
                STATIC.WINDOWS:Remove()
            end)
        ]],true)
    end
end)