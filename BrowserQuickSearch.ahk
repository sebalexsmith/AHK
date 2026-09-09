#Include C:\Users\sebal\OneDrive\Dokumenter\Personal\AHK\Utils.ahk


handleSearchService(service) {

    static urls := {0 : ""
		          , 1 : "https://www.google.com/search?hl=en&q="
		          , 21: "https://translate.google.com/?sl=auto&tl=en&text="
		          , 22: "https://translate.google.com/?sl=en&tl=no&text="
		          , 3 : "https://www.google.com/maps/search/"
		          , 4 : "https://www.youtube.com/results?search_query="
                  , 5 : "https://www.imdb.com/find/?q="
		          , 6 : "https://www.google.com/search?site=imghp&tbm=isch&q="}

    static mods := {11: " meaning"
		          , 12: " synonym"}

    static tags := {0 : ["Manual Input", "Alt + 0"]
		          , 1 : ["Search", "Alt + 1"]
		          , 11: ["Define", "Ctrl + Alt + 1"]
		          , 12: ["Synonym", "Shift + Alt + 1"]
		          , 21: ["Translate (Auto to EN)", "Alt + 2"]
		          , 22: ["Translate (EN to NO)", "Ctrl + Alt + 2"]
		          , 3 : ["Map Search", "Alt + 3"]
		          , 4 : ["YouTube Search", "Alt + 4"]
		          , 5 : ["IMDb Search", "Alt + 5"]
		          , 6 : ["Image Search", "Alt + 6"]}

    static displayOrder = [0, 1, 11, 12, 21, 22, 3, 4, 5, 6]




    ; If the user wants to see all the key mappings and what they do, info
    if (service == "i") {
        Gui, New, -SysMenu +Resize, Key Mappings
        Gui, Font, s10, Consolas
        Gui, Add, ListView, r10, Service|Key bind

        for _, key in displayOrder {
            pair := tags[key]
            LV_Add("", pair[1], pair[2])
        }

        LV_ModifyCol()
        LV_ModifyCol(2, "Right")
        Gui, Add, Button, w100 Default gCloseSearchGUI, OK
        Gui, Show
        return
    }




    ; If there is no support for the selected service, end function
    if (!tags.HasKey(service)) {
	    MsgBox,, Unsupported Service, The attempted service (%service%) is not yet supported, 10
	    return
    }




    ; Prepare the clipboard backup and retrieve selected text
    backup := ClipboardAll
    Clipboard := ""
    Send ^c
    ClipWait 0




    ; If no text was selected, prompt user for input, else use contents of clipboard
    if (ErrorLevel or Clipboard = "") {
        tag := tags[service][1]
        InputBox query, %tag%,,, 250, 100

	; If the prompt was cancelled, restore clipboard backup and end function
        if (ErrorLevel) {
            Clipboard := backup
            return
        }
    } else {
	    query := Clipboard
    }




    ; Handle special search cases
    if (mods.HasKey(service)) {
	    query .= mods[service]
	    service := 1
    }




    ; Handle manual input, checking for valid url or filepath
    if (service = 0) {
	    if (!RegExMatch(query, "^(?:(https?|ftp)://)?([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}(/[^\s]*)?$") and !FileExist(query)) {
	        MsgBox,, Invalid Manual Input, Invalid URL or file path: %query%. Please check the input and try again., 10
	        Clipboard := backup
	        return
	    }

	; If it's a domain without http/https, prepend https://
    	if !RegExMatch(query, "^(https?|ftp)://") {
    	    query := "https://" query
    	}
    }




    ; Perform the search and restore clipboard backup
    Run % urls[service] query
    Clipboard := backup




    focusOnBrowser()
}




  <!0::handleSearchService(0)		; Manual Input
  <!1::handleSearchService(1)		; Search
<^<!1::handleSearchService(11)		; Define
<+<!1::handleSearchService(12)		; Synonyms
  <!2::handleSearchService(21)		; Translate Text (Auto -> English)
<^<!2::handleSearchService(22)		; Translate Text (English -> Norwegian)
  <!3::handleSearchService(3)		; Map Search
  <!4::handleSearchService(4)		; YouTube Search
  <!5::handleSearchService(5)       ; IMDB Search
  <!6::handleSearchService(6)		; Image Search

  <!i::handleSearchService("i")		; Quick search shortcut mappings




CloseSearchGUI:
    Gui, Destroy
return
