; FUNCTIONS WHICH CAN BE UNIVERSALLY HELPFUL


; Get the default browser
defaultBrowser() {
    return "firefox.exe"
}


; Refocus on the browser
focusOnBrowser(delay := 200) {
    Sleep delay

    browser := defaultBrowser()

    if (!WinExist("ahk_exe " browser)) {
	MsgBox,, Error, Default browser (%browser%) is not currently open., 5
	return
    }

    WinActivate, ahk_exe %browser%
}


; For use in hotstrings to keep clipboard intact, like a wrapper
returnString(string) {

    backup := ClipboardAll

    Clipboard := string
    ClipWait 1

    if (ErrorLevel) {
        MsgBox, Failed to set clipboard to: %string%
	Clipboard := backup
        return
    }

    Send ^v
    Sleep 100

    Clipboard := backup
    
}