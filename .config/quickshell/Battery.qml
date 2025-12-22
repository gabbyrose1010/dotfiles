pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    property bool ten: SystemStats.batteryLevel <= 15
    property bool thirty: SystemStats.batteryLevel <= 25 && !ten
    property bool fourty: SystemStats.batteryLevel <= 40 && !thirty
    property bool sixty: SystemStats.batteryLevel <= 60 && !fourty
    property bool eighty: SystemStats.batteryLevel <= 80 && !sixty
    property string noCharge: ten ? "󱟩" 
                            : thirty ? "󰁻" 
                            : fourty ? "󰁽"
                            : sixty ? "󰁿" 
                            : eighty ? "󰂁" : "󱈑"
    property string yesCharge: ten ? "󰢜" 
                             : thirty ? "󰂇"
                             : fourty ? "󰂈" 
                             : sixty ? "󰂉" 
                             : eighty ? "󰂊" : "󱈑"

    //things to grab
    property string icon: SystemStats.isCharging ? yesCharge : noCharge
    property string percent: SystemStats.batteryLevel
}
