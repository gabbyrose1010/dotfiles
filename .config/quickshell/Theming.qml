pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    // individual theming can be done in Components folders

    // colors
    property color colBg: "#2a1b26"     // bar and widget bg
    property color colBord: "#eeeeee"   // bar and widget border color
    property color colFg: "#a9b1d6"
    property color colMuted: "#444b6a"
    property color colPrim: "#0db9d7"
    property color colSec: "#7aa2f7"    // bar text color
    property color colTert: "#e0af68"

    // fonts and formats
    property string fontFamily: kitFont
    property string fontSecond: defFont
    property int fontSize: 14
    property string barClockFormat: "ddd, MMM dd - HH:mm"

    // bar sizing
    property int barHeight: 30    // bar thickness
    property int borderWidth: 3   // border thickness for bar and popups
    property int barTop: 0        // margin between screen top and bar
    property int barLeft: 0       // margin between screen left and bar
    property int barRight: 0      // margin between screen right and bar

    // popup sizing
    property int popTop: 10            // margin between popup window and bar
    property string popLoc: "right"   // whether popups are on right, center, or left
    
    // preset colors
    property color transparent: "#00000000"
    property color white: "#ffffff"
    property color black: "#000000"
    
    // preset fonts
    property string defFont: "JetBrainsMono Nerd Font"
    property string kitFont: "SpaceMono Nerd Font"
}
