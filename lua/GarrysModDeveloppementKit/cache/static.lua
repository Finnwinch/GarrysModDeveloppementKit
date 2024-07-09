GarrysModDeveloppementKit = {}
--[[----------------------------------------------------------------
    Colors options
]]------------------------------------------------------------------
GarrysModDeveloppementKit.Colors = {}
GarrysModDeveloppementKit.Colors.Primary    = Color(0, 123, 255)
GarrysModDeveloppementKit.Colors.Secondary  = Color(108, 117, 125)
GarrysModDeveloppementKit.Colors.Success    = Color(40, 167, 69)
GarrysModDeveloppementKit.Colors.Danger     = Color(220, 53, 69)
GarrysModDeveloppementKit.Colors.Warning    = Color(255, 193, 7)
GarrysModDeveloppementKit.Colors.Info       = Color(23, 162, 184)
GarrysModDeveloppementKit.Colors.Light      = Color(248, 249, 250)
GarrysModDeveloppementKit.Colors.Dark       = Color(33, 37, 41)
GarrysModDeveloppementKit.Colors.Gray       = Color(52, 58, 64)
--[[----------------------------------------------------------------
    String options
]]------------------------------------------------------------------
GarrysModDeveloppementKit.String = {}
GarrysModDeveloppementKit.String.AddonsName = SERVER and "Garry's Mod Développement Kit"
GarrysModDeveloppementKit.String.AddonsVersion = SERVER and "1"
--[[----------------------------------------------------------------
    Screen options
]]------------------------------------------------------------------
GarrysModDeveloppementKit.Screen = {}
GarrysModDeveloppementKit.Screen.Scale = CLIENT and 1
GarrysModDeveloppementKit.Screen.Wide = CLIENT and ScrW()
GarrysModDeveloppementKit.Screen.Tall = CLIENT and ScrH()
GarrysModDeveloppementKit.Screen.ResponsiveWide = CLIENT and function(value) return GarrysModDeveloppementKit.Screen.Wide / (1920 / value) * GarrysModDeveloppementKit.Screen.Scale end
GarrysModDeveloppementKit.Screen.ResponsiveTall = CLIENT and function(value) return GarrysModDeveloppementKit.Screen.Tall / (1080 / value) * GarrysModDeveloppementKit.Screen.Scale end
--[[----------------------------------------------------------------
    Materials options
]]------------------------------------------------------------------
GarrysModDeveloppementKit.Materials = {}
--[[----------------------------------------------------------------
    Database options
]]------------------------------------------------------------------
GarrysModDeveloppementKit.Database = {}
GarrysModDeveloppementKit.Database.Host = SERVER and "localhost"
GarrysModDeveloppementKit.Database.Port = SERVER and "3306"
GarrysModDeveloppementKit.Database.Database = SERVER and "MyTable"
GarrysModDeveloppementKit.Database.Username = SERVER and "root"
GarrysModDeveloppementKit.Database.Password = SERVER and "root"