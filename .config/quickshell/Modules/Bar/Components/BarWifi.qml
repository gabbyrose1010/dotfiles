import Quickshell
import QtQuick
import "./SymLinks/"

Text {
    text: Wifi.icon + " " + Wifi.shortName
    color: Theming.colSec
    font {
        family: Theming.fontFamily
        pixelSize: Theming.fontSize
        bold: true 
    }    
}
