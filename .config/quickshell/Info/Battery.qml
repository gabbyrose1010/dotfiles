pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    
    property string percent: SystemStats.batteryLevel
    property string noCharge: percent <= 15 ? "󱟩" 
                            : percent <= 25 ? "󰁻" 
                            : percent <= 40 ? "󰁽"
                            : percent <= 60 ? "󰁿" 
                            : percent <= 80 ? "󰂁" 
                            : percent == 100 ? "󱈑"
                            : "󰂂"
    property string yesCharge: percent <= 15 ? "󰢜" 
                             : percent <= 25 ? "󰂇"
                             : percent <= 40 ? "󰂈" 
                             : percent <= 60 ? "󰂉" 
                             : percent <= 80 ? "󰂊" 
                             : percent == 100 ? "󱈑"
                             : "󰂋"

    //things to grab
    property string icon: SystemStats.isCharging ? yesCharge : noCharge
}
