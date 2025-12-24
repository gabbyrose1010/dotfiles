pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    property string name: SystemStats.blueName
    property bool blue: name != " "
    property bool enabled: SystemStats.blueEnabled
    property string icon: !enabled ? "󰂲"
                        : !blue ? ""
                        : "󰂱"
    property string shortName: name.substring(0,4)
    property bool displayString: enabled && blue
}
