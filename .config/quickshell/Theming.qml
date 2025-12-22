pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    property color colBg: "#2a1b26"
    property color colFg: "#a9b1d6"
    property color colMuted: "#444b6a"
    property color colPrim: "#0db9d7"
    property color colSec: "#7aa2f7"
    property color colTert: "#e0af68"
    property string fontFamily: "JetBrainsMono Nerd Font"
    property int fontSize: 14
    property string barClockFormat: "ddd, MMM dd - HH:mm"
}
