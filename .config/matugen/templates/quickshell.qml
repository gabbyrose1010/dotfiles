pragma Singleton
import Quickshell
import QtQuick

Singleton {
    id: root
    property color bg: "{{colors.surface.default.hex}}"
    property color one: "{{colors.primary.default.hex}}"
    property color two: "{{colors.secondary.default.hex}}"
    property color three: "{{colors.tertiary.default.hex}}"
    property color out: "{{colors.outline_variant.default.hex}}"
}
