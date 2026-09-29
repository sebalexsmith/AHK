#Include C:\Users\sebal\OneDrive\Dokumenter\Personal\AHK\Utils.ahk




; Disable capslock unless ctrl + capslock is pressed together
SetCapsLockState, AlwaysOff
^CapsLock::CapsLock




; LAUNCH APPS

; BitWarden
CapsLock & b:: Run "C:\Program Files\WindowsApps\8bitSolutionsLLC.bitwardendesktop_2025.4.2.0_x64__h4e712dmw3xyy\app\Bitwarden.exe"

; Excel
CapsLock & x:: Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Excel.lnk"

; Minecraft Launcher
CapsLock & m:: Run "C:\XboxGames\Minecraft Launcher\Content\Minecraft.exe"

; Netflix
CapsLock & n:: Run "C:\Users\sebal\Documents\Auxiliary\Netflix.lnk"

; NordVPN
CapsLock & v:: Run "C:\Program Files\NordVPN\NordVPN.exe"

; Phone Link
CapsLock & p:: Run "C:\Users\sebal\Documents\Auxiliary\Phone Link.lnk"

; VS Code
CapsLock & c:: Run "C:\Users\sebal\AppData\Local\Programs\Microsoft VS Code\Code.exe"

; Word
CapsLock & w:: Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Word.lnk"

; Fitness Tracker CLI
CapsLock & f:: 
    Run, cmd /c "tracker || pause", , Max
return



; Launch VS Code with python modules folder open
CapsLock & l:: Run "C:\Users\sebal\AppData\Local\Programs\Microsoft VS Code\Code.exe" "C:\PythonModules"




; LAUNCH WEBSITES

; Google Drive
CapsLock & d::
    Run "https://drive.google.com/drive/home"
    focusOnBrowser()
return

; Gmail
CapsLock & g::
    Run "https://mail.google.com/mail/u/0/#inbox"
    focusOnBrowser()
return

; Facebook Messenger
CapsLock & s::
    Run "https://www.facebook.com/messages/"
    focusOnBrowser()
return

; YouTube
CapsLock & y::
    Run "https://www.youtube.com/"
    focusOnBrowser()
return

; Claude
CapsLock & q::
    Run "https://claude.ai/"
    focusOnBrowser()
return

; Wordtips
CapsLock & o::
    Run "https://word.tips/words-with-letters/"
    focusOnBrowser()
return




; Daily
CapsLock & t::
    Run "https://www.theatlantic.com/games/"
    Sleep 50
    Run "https://travle.earth/"
    Sleep 50
    Run "https://starship-spacex.fandom.com/wiki/Starship_Flight_Test_15"
    focusOnBrowser()
return




; LAUNCH FOLDERS

; Auxiliary
CapsLock & a:: 
    Run "C:\Users\sebal\Documents\Auxiliary"
return

; AHK
CapsLock & z::
    Run "C:\Users\sebal\OneDrive\Dokumenter\Personal\AHK"
return

; This repo
CapsLock & LShift::
    Run "C:\Users\sebal\AppData\Local\Programs\Microsoft VS Code\Code.exe" "C:\Users\sebal\OneDrive\Dokumenter\Personal\AHK"
return









