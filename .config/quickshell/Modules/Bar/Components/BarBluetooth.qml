import Quickshell
import QtQuick
import "./SymLinks/"

Text {
    text: Bluetooth.displayString ? Bluetooth.icon + " " + Bluetooth.shortName
        : Bluetooth.icon
    color: Theming.colSec
    font {
        family: Theming.fontFamily
        pixelSize: Theming.fontSize
        bold: true
    }
}
