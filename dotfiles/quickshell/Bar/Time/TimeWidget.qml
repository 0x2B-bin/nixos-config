import QtQuick
import "../../config.js" as Config

Text {
    text: Time.time
    font.pixelSize: Config.font.fontSize
    font.family: Config.font.fontFamily
    font.bold: true
    color: "#ffffff"
}
