import XMonad 
import Data.Monoid
import System.Exit
import XMonad.Config.Azerty
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Grid
import XMonad.Layout.Roledex

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

myTerminal = "urxvt"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

myBorderWidth   = 0

myModMask       = mod4Mask

myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]

myNormalBorderColor  = "#002b36"
myFocusedBorderColor = "#839496"

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    [ ((modm .|. shiftMask, xK_c     ), kill)
    , ((modm,               xK_space ), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((modm,               xK_n     ), refresh)
    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp  )
    , ((modm,               xK_m     ), windows W.focusMaster  )
    , ((modm,               xK_Return), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    , ((modm,               xK_h     ), sendMessage Shrink)
    , ((modm,               xK_l     ), sendMessage Expand)
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++

    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    ]

myLayout = tiled ||| Mirror tiled ||| Full ||| Grid ||| Roledex 
    where
        tiled = Tall nmaster delta ratio

        nmaster = 1

        ratio   = 1/2

        delta   = 3/100

myManageHook = composeAll
    [ className =? "MPlayer"           --> doFloat
    , className =? "Plugin-container"  --> doFloat]

myEventHook = mempty

myLogHook = return ()

myStartupHook = return ()

main = xmonad =<< statusBar myBar myPP toggleStrutsKey defaults { keys = \c -> azertyKeys c `M.union` keys defaults c } 

myBar = "xmobar"

myPP = xmobarPP { ppCurrent = xmobarColor "#ffffff,#93a1a1" "" . wrap " " "" 
                , ppTitle   = const ""
                , ppLayout  = xmobarColor "#ffffff,#93a1a1" "" .
                    (\ x -> pad $ case x of
                        "Tall"          -> ": t"
                        "Mirror Tall"   -> ": m"
                        "Full"          -> ": f"
                        "Grid"          -> ": g"
                        "Roledex"       -> ": r"
                        _               -> x
                    )
                , ppHidden   = const ""
                , ppSep    = ""
                }
				
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

defaults = defaultConfig {
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

        keys               = myKeys,
        mouseBindings      = myMouseBindings,

        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }
