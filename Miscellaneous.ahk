#Include C:\Users\sebal\OneDrive\Dokumenter\Personal\AHK\Utils.ahk

; Set global variables for opening browser on right alt (gr) tap
countRAlt := 0
lastTimeRAlt := 0


; SMALLER OPTIMIZATIONS
; -----------------------------------------------------------------------------



; Remap the copilot key on my keyboard
; -----------------------------------------------------------------------------

; Remap as right contorl
<+<#f23::Send {Blind}{LShift Up}{LWin Up}{RControl Down}
<+<#f23 Up::Send {RControl Up}

; Remap as open new firefox window
; +<#f23::
;     Send {LShift Up}{RShift Up}
;     Sleep 50
;     Run % defaultBrowser()
; return

; Set tapping right alt (gr) three times to open browser
~RAlt::
    thisTime := A_TickCount
    if (thisTime - lastTimeRAlt < 300) {
        countRAlt += 1
    } else {
        countRAlt := 1
    }
    lastTimeRAlt := thisTime

    if (countRAlt >= 3) {
        Run % defaultBrowser()
        countRAlt := 0
    }
return




; Add more functionality to the numpad on my keyboard
; -----------------------------------------------------------------------------

; When Shift + Numpad5 is pressed, send equals sign
NumpadClear:: Send, =

; When Shift + NumpadAdd is pressed, send F2 to edit cell in excel
+NumpadAdd:: Send, {F2}




; Open my personalized ASCII table
; -----------------------------------------------------------------------------

; Open ASCII table on Ctrl + Alt + A
^!a::
    Run C:\Users\sebal\OneDrive\Bilder\Other\ASCII.png
return




; Add more accessable traversability to default browser
; -----------------------------------------------------------------------------

; Goes back and forward one page with only one hand (works in file explorer too)
RAlt & Left::Send !{Left}
RAlt & Right::Send !{Right}

; Traverse tabs (works for VS Code and Excel too +)
RShift & Left::Send ^{PgUp}
Rshift & Right::Send ^{PgDn}




; Change marked text from all caps to no caps or back
; -----------------------------------------------------------------------------

; Set highlighted text to all lowercase (Ctrl + Alt + L)
^!l::
    Clipboard := ""
    Sleep 50
    Send ^c
    ClipWait, 0
    StringLower, Clipboard, Clipboard
    Send ^v
return

; Set highlighted text to all uppercase (Ctrl + Alt + U)
^!u::
    Clipboard := ""
    Sleep 50
    Send ^c
    ClipWait, 0
    StringUpper, Clipboard, Clipboard
    Send ^v
return




; Additional highlighting
; -----------------------------------------------------------------------------

; Highlight the line the cursor is active on (Alt + A)
!a::
    Send {Home}
    Send +{End}
return

; Highlight the word the cursor is active on (Alt + W)
!w::
    Send ^{Left}
    Send ^+{Right}
return
















