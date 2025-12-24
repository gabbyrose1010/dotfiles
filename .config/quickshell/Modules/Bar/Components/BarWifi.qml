import Quickshell
import QtQuick
import "./SymLinks/"

Text {
    text: Wifi.displayString ? Wifi.icon + " " + Wifi.shortName
        : Wifi.icon
    color: Theming.colSec
    font {
        family: Theming.fontFamily
        pixelSize: Theming.fontSize
        bold: true 
    }    
}
