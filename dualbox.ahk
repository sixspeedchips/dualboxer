SetWorkingDir %A_ScriptDir%
#SingleInstance Force
SetTitleMatchMode,2
; #IfWinActive ahk_exe WowClassic.exe
Thread, interrupt, 0

SetKeyDelay, 0, 150


Width := 1024
Height := 768
master_pid:=""
slave_pid:=""
slaves := {}
suspended := 0


;~ read the saved positions or center if not previously saved
IniRead, gui_position, settings.ini, window position, gui_position, Center

Gui, Default
Gui, Font, s10, Verdana  
; Gui, Margin, s10 h1

Gui, Add, Button,  greloader, Reload
Gui, Add, Button,  y+5 w100 gsuspender v_Suspend, Suspend

Gui, Add, Text,y+5 Section, Master ID:
Gui, Add, Text,xs+100 ys+0 w100 vMid, %master_pid%
Gui, Add, Text,y+5 xs+0 w200 vSText,Slave IDs (0):
Gui, Add, ListView, w200 vSid
Gui, ListView, Sid
Loop, 10 {
    LV_Add("", "Column-1 | Row-" A_Index ,  "Column-2 | Row-" A_Index,  "Column-3 | Row-" A_Index)
}
; Gui, Add, Text,xs+100 ys+0 w100 vSid, %slave_pid%

Gui, +Resize -MaximizeBox
Gui, +Alwaysontop
Gui, +Hwndgui_id

Gui, Show, %gui_position%, Dual Boxer
Return



dbGuiClose:
    Gosub, savePos
ExitApp

savePos:
    WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
    IniWrite, x%gui_x% y%gui_y%, settings.ini, window position, gui_position
Return


suspender:
    suspended := !suspended
    Suspend
    if (suspended){
        GuiControl, Text,_Suspend, Unsuspend
    } 
    else {
        GuiControl, Text,_Suspend, Suspend
    }
Return

reloader:
    Gosub, savePos
    Reload
Return

^SPACE::  
    Winset, Alwaysontop, , A
; WinSet, Style, -0xC00000, A
Return

^+SPACE::
    WinGet, curr, PID, A
    ; MsgBox, %curr%
    ; (A_ScreenWidth/2)-(%Width%/2), (A_ScreenHeight/2)-(%Height%/2)
    WinMove, ahk_pid %curr%,,,,%Width%,%Height%,

Return

^F11::
WinGet, master_pid_get, PID, A
if(master_pid_get == master_pid){
    master_pid := ""
}else{
    master_pid := master_pid_get
}
GuiControl, Text,Mid,%master_pid%

; MsgBox, , PIDSET, Master pid set with PID = %master_pid%, 5
Return

^F12::
; WinGet, %s%, PID, A
WinGet, slave_pid, PID, A
WinGet, s, PID, A
n:=""
if(slaves[s]){
    slaves.Remove(s)
}  else  {
    slaves[s] := 1
}
Gui, Default
for k, v in slaves
    n .= k "=" v "`n"
    ; LV_Add"", k , v)
str := Format("Slave IDs ({:d}):", slaves.MaxIndex())
GuiControl, Text, SText, %str%
Return

^F1::
    MsgBox % slaves.MaxIndex()
Return

~q:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, q, ahk_pid %k% 
    Return 
}

~t:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, t, ahk_pid %k% 
    Return 
}

~F1:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {F1}, ahk_pid %k% 
    Return 
}

~F2:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {F2}, ahk_pid %k% 
    Return 
}


~F9:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {F9}, ahk_pid %k% 
    Return 
}

~1:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, 1, ahk_pid %k% 
    Return 
}

~v:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, v, ahk_pid %k% 
    Return 
}
    
~2:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, 2, ahk_pid %k% 
    Return 
}
    
~3:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, 3, ahk_pid %k% 
    Return 
}
    
~4:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, 4, ahk_pid %k% 
    Return 
}
    
~5:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, 5, ahk_pid %k% 
    Return 
}
    
~6:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, 6, ahk_pid %k% 
    Return 
}
    
~7:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, 7, ahk_pid %k% 
    Return
}
    
~8:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, 8, ahk_pid %k% 
    Return
}
    
~9:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, 9, ahk_pid %k% 
    Return
}
    
~0:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, 0, ahk_pid %k% 
    Return
}
    
~=:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, =, ahk_pid %k%
    Return 
}
    
~-:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, -, ahk_pid %k% 
    Return
}
    
~Numpad1:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {Numpad1}, ahk_pid %k% 
    Return
}

~Numpad2:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {Numpad2}, ahk_pid %k% 
    Return
}

~Space:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {Space}, ahk_pid %k% 
    Return
}
    


~f:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {f}, ahk_pid %k% 
    Return
}

~r:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {r}, ahk_pid %k% 
    Return
}
~z:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {z}, ahk_pid %k% 
    Return
}

~x:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {x}, ahk_pid %k% 
    Return
}
; need a assist macro here
~e:: 
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {Numpad9}, ahk_pid %k% 
        ControlSend,, {e}, ahk_pid %k% 

Return
}
    

~Shift & ~s::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {s}, ahk_pid %k%
    Return
}


;**********************************************************************
;**************************SHIFT MODIFIERS*****************************
;**********************************************************************
    

~Shift & ~r::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {ShiftDown}r{ShiftUp}, ahk_pid %k%
        ControlSend,, {ShiftDown}r{ShiftUp}, ahk_pid %k%
    Return
}

~Shift & ~1::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {ShiftDown}1{ShiftUp}, ahk_pid %k%
        ControlSend,, {ShiftDown}1{ShiftUp}, ahk_pid %k%
    Return
}
    
~Shift & ~2::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {ShiftDown}2{ShiftUp}, ahk_pid %k%
        ControlSend,, {ShiftDown}2{ShiftUp}, ahk_pid %k%
    Return
}
    
~Shift & ~3::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {ShiftDown}3{ShiftUp}, ahk_pid %k%
        ControlSend,, {ShiftDown}3{ShiftUp}, ahk_pid %k%
    Return
}
    
~Shift & ~4::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {ShiftDown}4{ShiftUp}, ahk_pid %k%
        ControlSend,, {ShiftDown}4{ShiftUp}, ahk_pid %k%
    Return
}
    
~Shift & ~5::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {ShiftDown}5{ShiftUp}, ahk_pid %k%
        ControlSend,, {ShiftDown}5{ShiftUp}, ahk_pid %k%
    Return
}
    
~Shift & ~6::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {ShiftDown}6{ShiftUp}, ahk_pid %k%
        ControlSend,, {ShiftDown}6{ShiftUp}, ahk_pid %k%
    Return
}
    
~Shift & ~7::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {ShiftDown}7{ShiftUp}, ahk_pid %k%
        ControlSend,, {ShiftDown}7{ShiftUp}, ahk_pid %k%
    Return
}
    
~Shift & ~8::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {ShiftDown}8{ShiftUp}, ahk_pid %k%
        ControlSend,, {ShiftDown}8{ShiftUp}, ahk_pid %k%
    Return
}
    
~Shift & ~9::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {ShiftDown}9{ShiftUp}, ahk_pid %k%
        ControlSend,, {ShiftDown}9{ShiftUp}, ahk_pid %k%
    Return
}
    
~Shift & ~0::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {ShiftDown}0{ShiftUp}, ahk_pid %k%
        ControlSend,, {ShiftDown}0{ShiftUp}, ahk_pid %k%
    Return
}
    
~Shift & ~-::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {ShiftDown}-{ShiftUp}, ahk_pid %k%
        ControlSend,, {ShiftDown}-{ShiftUp}, ahk_pid %k%
    Return
}
    
~Shift & ~=::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {ShiftDown}={ShiftUp}, ahk_pid %k%
        ControlSend,, {ShiftDown}={ShiftUp}, ahk_pid %k%
    Return
}
    
;**********************************************************************
;***************************ALT MODIFIERS******************************
;**********************************************************************
    
~Alt & ~1::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {AltDown}1{AltUp}, ahk_pid %k%
        ControlSend,, {AltDown}1{AltUp}, ahk_pid %k%
    Return
}
    
~Alt & ~2::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {AltDown}2{AltUp}, ahk_pid %k%
        ControlSend,, {AltDown}2{AltUp}, ahk_pid %k%
    Return
}
    
~Alt & ~3::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {AltDown}3{AltUp}, ahk_pid %k%
    for k,v in slaves
        ControlSend,, {AltDown}3{AltUp}, ahk_pid %k%
    Return
}
    
~Alt & ~4::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {AltDown}4{AltUp}, ahk_pid %k%
    for k,v in slaves
        ControlSend,, {AltDown}4{AltUp}, ahk_pid %k%
    Return
}
    
~Alt & ~5::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {AltDown}5{AltUp}, ahk_pid %k%
        ControlSend,, {AltDown}5{AltUp}, ahk_pid %k%
    Return
}
    
~Alt & ~6::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {AltDown}6{AltUp}, ahk_pid %k%
        ControlSend,, {AltDown}6{AltUp}, ahk_pid %k%
    Return
}
    
~Alt & ~7::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {AltDown}7{AltUp}, ahk_pid %k%
        ControlSend,, {AltDown}7{AltUp}, ahk_pid %k%
    Return
}
    
~Alt & ~8::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {AltDown}8{AltUp}, ahk_pid %k%
        ControlSend,, {AltDown}8{AltUp}, ahk_pid %k%
    Return
}
    
~Alt & ~9::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {AltDown}9{AltUp}, ahk_pid %k%
        ControlSend,, {AltDown}9{AltUp}, ahk_pid %k%
    Return
}
    
~Alt & ~0::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {AltDown}0{AltUp}, ahk_pid %k%
        ControlSend,, {AltDown}0{AltUp}, ahk_pid %k%
    Return
}
    
~Alt & ~-::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {AltDown}-{AltUp}, ahk_pid %k%
        ControlSend,, {AltDown}-{AltUp}, ahk_pid %k%
    Return
}
    
~Alt & ~=::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {AltDown}={AltUp}, ahk_pid %k%
        ControlSend,, {AltDown}={AltUp}, ahk_pid %k%
    Return
}
    
;**********************************************************************
;***************************CTRL MODIFIERS*****************************
;**********************************************************************
    
~Ctrl & ~1::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {CtrlDown}1{CtrlUp}, ahk_pid %k%
        ControlSend,, {CtrlDown}1{CtrlUp}, ahk_pid %k%
    Return
}
    
~Ctrl & ~2::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {CtrlDown}2{CtrlUp}, ahk_pid %k%
        ControlSend,, {CtrlDown}2{CtrlUp}, ahk_pid %k%
    Return
}
    
~Ctrl & ~3::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {CtrlDown}3{CtrlUp}, ahk_pid %k%
        ControlSend,, {CtrlDown}3{CtrlUp}, ahk_pid %k%
    Return
}
    
~Ctrl & ~4::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {CtrlDown}4{CtrlUp}, ahk_pid %k%
        ControlSend,, {CtrlDown}4{CtrlUp}, ahk_pid %k%
    Return
}
    
~Ctrl & ~5::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {CtrlDown}5{CtrlUp}, ahk_pid %k%
        ControlSend,, {CtrlDown}5{CtrlUp}, ahk_pid %k%
    Return
}
    
~Ctrl & ~6::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {CtrlDown}6{CtrlUp}, ahk_pid %k%
        ControlSend,, {CtrlDown}6{CtrlUp}, ahk_pid %k%
    Return
}
    
~Ctrl & ~7::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {CtrlDown}7{CtrlUp}, ahk_pid %k%
        ControlSend,, {CtrlDown}7{CtrlUp}, ahk_pid %k%
    Return
}
    
~Ctrl & ~8::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {CtrlDown}8{CtrlUp}, ahk_pid %k%
        ControlSend,, {CtrlDown}8{CtrlUp}, ahk_pid %k%
    Return
}
    
~Ctrl & ~9::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {CtrlDown}9{CtrlUp}, ahk_pid %k%
        ControlSend,, {CtrlDown}9{CtrlUp}, ahk_pid %k%
    Return
}
    
~Ctrl & ~0::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {CtrlDown}0{CtrlUp}, ahk_pid %k%
        ControlSend,, {CtrlDown}0{CtrlUp}, ahk_pid %k%
    Return
}
    
~Ctrl & ~-::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {CtrlDown}-{CtrlUp}, ahk_pid %k%
        ControlSend,, {CtrlDown}-{CtrlUp}, ahk_pid %k%
    Return
}
    
~Ctrl & ~=::
if(WinActive("ahk_pid" . master_pid)) { 
    for k,v in slaves
        ControlSend,, {CtrlDown}={CtrlUp}, ahk_pid %k%
        ControlSend,, {CtrlDown}={CtrlUp}, ahk_pid %k%
    Return
}