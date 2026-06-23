import QtQuick
import "../config.js" as Config


Rectangle {
    width: 5
    height: 5
    color: Config.colors.color0 || "white"
    radius: width * 0.5
}
