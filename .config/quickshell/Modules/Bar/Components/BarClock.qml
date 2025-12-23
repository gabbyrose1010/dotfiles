import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import "~/dotfiles/.config/quickshell/Info/DateTime.qml"
Item {
    id: root

    //property string format: Theming.barClockFormat
    //property string dateTime: Qt.formatDateTime(new Date(), format)
    
    Text {
        anchors.centerIn: parent
        text: BarClockTime.dateTime(Theming.barClockFormat)
        color: Theming.colSec
        font { family: Theming.fontFamily; pixelSize: Theming.fontSize; bold: true }
    }
        
}
