on run (volumeName)
tell application "Finder"
tell disk (volumeName as string)
open

set theXOrigin to WINX
set theYOrigin to WINY
set theWidth to WINW
set theHeight to WINH

set theBottomRightX to (theXOrigin + theWidth)
set theBottomRightY to (theYOrigin + theHeight)
set dsStore to "\"" & "/Volumes/" & volumeName & "/" & ".DS_STORE\""

tell container window
set current view to icon view
set toolbar visible to false
set statusbar visible to false
set the bounds to {theXOrigin, theYOrigin, theBottomRightX, theBottomRightY}
set statusbar visible to false
end tell

set opts to the icon view options of container window
tell opts
set icon size to ICON_SIZE
set text size to TEXT_SIZE
set arrangement to not arranged
end tell

delay 5
-- Positioning
set position of item "RawTherapee.app" to {266, 185}
set position of item "Applications" to {720, 185}
set position of item "Website.webloc" to {320, 438}
set position of item "Documentation.webloc" to {442, 438}
set position of item "Report Bug.webloc" to {570, 438}
set position of item "Forum.webloc" to {680, 438}
set position of item ".background" to {1200, 1200}
set position of item ".VolumeIcon.icns" to {1200, 1200}
set position of item "LICENSE.txt" to {800, 2}
set extension hidden of item "LICENSE.txt" to true
set extension hidden of item "Website.webloc" to true
set extension hidden of item "Documentation.webloc" to true
set extension hidden of item "Report Bug.webloc" to true
set extension hidden of item "Forum.webloc" to true

-- Application and QL Link Clauses
APPLICATION_CLAUSE
QL_CLAUSE
close
open
-- Force saving of the size
delay 5

tell container window
set statusbar visible to false
set the bounds to {theXOrigin, theYOrigin, theBottomRightX - 10, theBottomRightY - 10}
end tell
end tell

delay 5

tell disk (volumeName as string)
tell container window
set statusbar visible to false
set the bounds to {theXOrigin, theYOrigin, theBottomRightX, theBottomRightY}
set current view to icon view
end tell
set theViewOptions to the icon view options of container window
set arrangement of theViewOptions to not arranged
set icon size of theViewOptions to 72
-- Settings background
set background picture of theViewOptions to file ".background:background.png"
end tell
--give the finder some time to write the .DS_Store file
delay 5

set waitTime to 0
set ejectMe to false
repeat while ejectMe is false
delay 5
set waitTime to waitTime + 1

if (do shell script "[ -f " & dsStore & " ]; echo $?") = "0" then set ejectMe to true
end repeat
log "waited " & waitTime & " seconds for .DS_STORE to be created."
end tell
end run
