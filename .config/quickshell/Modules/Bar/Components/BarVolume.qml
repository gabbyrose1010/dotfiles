import Quickshell
import QtQuick
import "./SymLinks/"

Text {
    text: Volume.icon + " " + Volume.percent
    color: Theming.colSec
    font { 
        family: Theming.fontFamily 
        pixelSize: Theming.fontSize 
        bold: true 
    }
}
