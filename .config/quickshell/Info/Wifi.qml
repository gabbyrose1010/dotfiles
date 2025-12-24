pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    property string name: SystemStats.wifiNet
    property bool wifi: name != " "
    property bool enabled: SystemStats.wifiEnabled
    property string icon: !enabled ? "󰖪"
                        : !wifi ? "󰤫"
                        : "󰖩"
    property string shortName: name.substring(0,4)
    property bool displayString: enabled && wifi
}
