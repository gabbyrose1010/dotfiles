pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    property bool wifi: SystemStats.wifiNet == "No Wifi"
    property string icon: !SystemStats.wifiEnabled ? "󰖪"
                        : wifi ? "󰤫"
                        : "󰖩"
    property string name: SystemStats.wifiNet
}
