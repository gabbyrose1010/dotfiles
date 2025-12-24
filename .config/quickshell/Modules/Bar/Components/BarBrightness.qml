import Quickshell
import QtQuick
import "./SymLinks/"

Text {
    text: Brightness.icon + " " + Brightness.percent
    color: Theming.colSec
    font {
        family: Theming.fontFamily
        pixelSize: Theming.fontSize
        bold: true
    }
}
