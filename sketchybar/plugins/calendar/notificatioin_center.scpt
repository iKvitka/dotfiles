--TODO: finish on click action for calendar to show macos notificaton center like default date in menu bar do

tell application "System Events"
    tell process "ControlCenter"
        tell menu bar item 1 of menu bar 1
            click
        end tell
    end tell
end tell

--
--tell application "System Events"
--    set visible of process "ControlCenter" to false
--end tell

--
tell application "System Events" to tell process "ControlCenter"
get entire contents of menu bar 1
end tell


--tell application "System Events"
--tell process "ControlCenter"
--set autohide to true
--end tell
--end tell

--tell application "System Events"
--tell dock preferences
--set autohide menu bar to true
--set dockAutohide to get autohide
--set autohide to true
--end tell
--end tell
--
--tell application "System Events"
--get entire contents of dock preferences
--end tell