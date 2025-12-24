pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    property color colBg: "#2a1b26" // bar and widget bg
    property color colBord: "#eeeeee" //
    property color colFg: "#a9b1d6"
    property color colMuted: "#444b6a"
    property color colPrim: "#0db9d7"
    property color colSec: "#7aa2f7" // bar text color
    property color colTert: "#e0af68"
    property string fontFamily: kitFont
    property int fontSize: 14
    property string barClockFormat: "ddd, MMM dd - HH:mm"

    // preset colors
    property color transparent: "#00000000"
    property color white: "#ffffff"
    property color black: "#000000"

    // preset fonts
    property string defFont: "JetBrainsMono Nerd Font"
    property string kitFont: "SpaceMono Nerd Font"
}
