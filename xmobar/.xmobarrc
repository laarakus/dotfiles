Config 
    { 
        font = "xft:Source Code Pro:size=8"
        , borderColor = "#839496"
        , bgColor = "#073642" 
        -- , border = FullBM 0
        , border = NoBorder
        , fgColor = "#839496"
        -- , alpha = 120 
        , position = Static { xpos = 0, ypos = 0, width = 1600, height = 19 }, 
        , lowerOnStart = True
        , hideOnStart = False
        , allDesktops = True
        , sepChar = "%"
        , alignSep = "}{"
        , overrideRedirect = True 
        , persistent = True 
        , commands = 
            [ 
            Run StdinReader
            -- cpu related
            , Run MultiCpu ["-t","<total0>%","-w","1"] 10
            , Run CoreTemp ["-t","<core0>"] 10
            -- memory related
            , Run Memory ["-t","<usedratio>%"] 10
            , Run Swap ["-t","<usedratio>%"] 10
            , Run DiskU [("/", "<usedp>%"), ("/home", "<usedp>%")]
                   ["-L", "20", "-H", "50", "-m", "1", "-p", "2"]
                          20
            -- network related
            , Run Com "iwgetid" ["-r"] "" 0
            , Run DynNetwork ["-t", "<dev>-<tx>,<rx>"] 30
            , Run Network "wlp3s0" ["-t","<rx>,<tx>"] 10 
            -- misc
            , Run BatteryP ["BAT0"] ["-t", "<acstatus>", "-L", "10", "-H", "80", "-l", "red", "-h", "green", "--", "-i", "ac", "-o", "<left>%"] 10
            , Run Kbd [("be", "En"), ("ara(basic)", "Ar")]
            , Run Volume "default" "Master" ["-t","<volume>%"] 10
            , Run Weather "GMMC" ["-t", "<tempC>°C"] 36000
            , Run Date "%A %d-%m-%Y %H:%M:%S" "date" 10
            -- usefull someday
            -- , Run DiskIO [("/", "/ <total>"), ("/home", "~ <total>")] ["-l", "green", "--normal","orange","--high","red"] 10
            -- , Run Cpu ["-t","<total>%"] 10
            -- , Run CpuFreq ["-t", "<cpu0>,<cpu1>"] 50
            -- , Run ThermalZone 0 ["-t","<temp>C"] 30 
            , Run NamedXPropertyLog "_XMONAD_LOG_TOP" "xm"
            , Run MPD ["-t","<statei> <ppos>/<plength>","--", "-P", ">>", "-Z", "|", "-S", "><"] 10
            ]
        , template = "%StdinReader% %mpd% }{ <fc=#fdf6e3,#657B83> %multicpu% %coretemp% %memory%-%swap% %disku% %dynnetwork% </fc><fc=#fdf6e3,#93a1a1> %battery% %default:Master% %kbd% </fc><fc=#fdf6e3,#cb4b16> %date% %GMMC% </fc>"
    }
