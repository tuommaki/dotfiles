import XMonad
import XMonad.Operations
import XMonad.Actions.DwmPromote
import XMonad.Hooks.DynamicLog   
import XMonad.Layout
import XMonad.Layout.Circle
import XMonad.Layout.Grid
import XMonad.Layout.IM
import XMonad.Layout.Reflect
import XMonad.Layout.NoBorders
import XMonad.Layout.MosaicAlt
import XMonad.Layout.DwmStyle
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spiral
import XMonad.Layout.SimpleFloat
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
 
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import Control.Monad ( when )
import Data.Bits ((.|.))
import Data.Ratio
import Graphics.X11                                                                                                    
import System.IO
 
main = do
   xmproc <- spawnPipe "xmobar" -- start xmobar
   xmonad $ ewmh defaultConfig
               { borderWidth        = 1
               , normalBorderColor  = "grey30"
               , focusedBorderColor = "#aecf96" 
               , workspaces         = ["1:web", "2:dev", "3:dev", "4:media", "5:tmp", "6:tmp", "7:tmp", "8:tmp", "9:tmp", "0:tmp"] 
--               , terminal           = "urxvtc"
               , terminal           = "urxvt256c-ml"
               , modMask            = mod4Mask
               , manageHook         = manageDocks
               , logHook            = takeTopFocus >> setWMName "LG3D" >> (dynamicLogWithPP $ customPP xmproc)
               , layoutHook         = avoidStruts (tiled ||| Mirror tiled ||| MosaicAlt M.empty ||| Circle ||| ResizableTall 1 (3/100) (1/2) [] ||| simpleFloat ||| myChatLayout ||| spiral (6/7) ||| noBorders Full) 
               , keys               = \c -> myKeys `M.union` 
               keys defaultConfig c 
               }
               where
                  tiled = Tall 1 (3%100) (1%2)



-- The chat workspace has a roster on the right.
myChatLayout = reflectHoriz $ withIM size roster $ reflectHoriz $ Grid 
  where
    -- Ratio of screen roster will occupy
    size = 1%5
    -- Match roster window
    roster = Title "Buddy List"

 
-- redifine some keys
--
myKeys = M.fromList $
   [ ((mod4Mask     , xK_p      ), shellPrompt myXPConfig)
   , ((mod4Mask     , xK_Return ), dwmpromote)
   , ((mod4Mask     , xK_b      ), sendMessage ToggleStruts)
   , ((mod4Mask     , xK_a      ), sendMessage MirrorShrink)
   , ((mod4Mask     , xK_z      ), sendMessage MirrorExpand)

 
   -- multimedia keys
   --
   -- XF86AudioLowerVolume
   , ((0            , 0x1008ff11), spawn "aumix -v -2")
   -- XF86AudioRaiseVolume
   , ((0            , 0x1008ff13), spawn "aumix -v +2")
   -- XF86AudioMute
   , ((0            , 0x1008ff12), spawn "amixer -q set PCM toggle")
   -- XF86AudioNext
   , ((0            , 0x1008ff17), spawn "mocp -f")
   -- XF86AudioPrev
   , ((0            , 0x1008ff16), spawn "mocp -r")
   -- XF86AudioPlay
   , ((0            , 0x1008ff14), spawn "mocp -G")
   ]
 

-- dynamiclog pretty printer for xmobar
--
customPP h = defaultPP 
                 {  ppHidden = xmobarColor "#00FF00" ""
                  , ppCurrent = xmobarColor "#FF0000" "" . wrap "[" "]"
                  , ppUrgent = xmobarColor "#FF0000" "" . wrap "*" "*"
                  , ppLayout = xmobarColor "#FF0000" ""
                  , ppTitle = xmobarColor "#00FF00" "" . shorten 80
                  , ppSep = "<fc=#0033FF> | </fc>"
                  , ppOutput = hPutStrLn h 
                  }
 
-- shellprompt config
--
myXPConfig = XPC { 
                           font                = "xft:DejaVu Sans Mono-8"
                         , bgColor             = "#111111"
                         , fgColor             = "#d5d3a7"
                         , bgHLight            = "#aecf96"
                         , fgHLight            = "black"
                         , borderColor         = "black"
                         , promptBorderWidth   = 0
                         , position            = Top
                         , height              = 15
                         , historySize         = 256
                         , defaultText         = ""
                         , autoComplete        = Nothing
                         , historyFilter       = id
                         , showCompletionOnTab = False
                         , promptKeymap        = defaultXPKeymap
                         , completionKey       = xK_Tab
                   }


-- Send WM_TAKE_FOCUS
takeTopFocus = withWindowSet $ maybe (setFocusX =<< asks theRoot) takeFocusX . W.peek

atom_WM_TAKE_FOCUS      = getAtom "WM_TAKE_FOCUS"
takeFocusX w = withWindowSet $ \ws -> do
    dpy <- asks display
    wmtakef <- atom_WM_TAKE_FOCUS
    wmprot <- atom_WM_PROTOCOLS

    protocols <- io $ getWMProtocols dpy w
    when (wmtakef `elem` protocols) $ do
        io $ allocaXEvent $ \ev -> do
            setEventType ev clientMessage
            setClientMessageEvent ev w wmprot 32 wmtakef currentTime
            sendEvent dpy w False noEventMask ev

