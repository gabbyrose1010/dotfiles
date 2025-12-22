pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    property bool twenty: SystemStats.volPerc <= 20
    property bool fourty: SystemStats.volPerc <= 40 && !twenty
    property string icon: SystemStats.volMuted ? ""
                        : twenty ? ""
                        : fourty ? ""
                        : ""
    property string percent: SystemStats.volPerc
}
