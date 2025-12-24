import Quickshell
import QtQuick
import Quickshell.Io
import "./SymLinks/"

Text {
    text: Battery.icon + " " + Battery.percent + "%"
    color: Theming.colSec
    font { 
        family: Theming.fontFamily 
        pixelSize: Theming.fontSize 
        bold: true 
    }
}
