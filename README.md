# AutoHotkey v1.1 scripts

AutoHotkey allows you to make custom automations, keyboard shortcuts, and hotstrings. Hotstrings are short character sequences that trigger a predefined longer sequence to replace it, ex: writing "btw" is automatically replaced by "by the way". Download AutoHotkey [here](https://www.autohotkey.com/), requires Windows.

These scripts contain the custom functionality I've created which I use every day. Contents:
- **BrowserQuickSearch.ahk**: A scalable function which takes the word(s) you have highlighted with the cursor, and depending on what action you want, it opens a tab in the browser using the highlighted text as a query. Just search the text, append "meaning" or "synonym" to it, google translate, google maps, image search, search YouTube or IMDb.
- **PythonHotstrings.ahk**: Hotstrings for lines I often write in Python to save a little time. [1]
- **RemapCapslock.ahk**: Deactivating Capslock to avoid accidentally pressing it (which is annoying), instead activate it when Ctrl and Capslock are pressed together. The Capslock button can now be used as a keyboard shortcut base, like Ctrl.
- **Miscellaneous.ahk**: Different smaller functions. Remapping the Copilot key on my keyboard, tab traversability, uppercase or lowercase highlighted text, highlight active word or line.
- **Utils.ahk**: A few functions used across the other files.

[1]: I add the less than character ("<") at the end of hotstrings to avoid accidental activation. It doesn't do anything other than that, just a convention I like. 

I also have a script for personal hotstrings like for writing out my emails etc, but as it contains personal information I added it to the .gitignore.