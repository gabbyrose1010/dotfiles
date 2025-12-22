pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    property string icon: "󰃠"
    property string percent: SystemStats.brightPerc
}
