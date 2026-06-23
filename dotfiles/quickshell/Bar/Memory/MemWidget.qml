import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell
import "../../config.js" as Config


Text {
    text: " " + Mem.mem + "%"
    font.pixelSize: Config.font.fontSize
    font.family: Config.font.fontFamily
    font.bold: true
    color: "#ffffff"
}
