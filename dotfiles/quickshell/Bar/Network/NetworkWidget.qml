import QtQuick
import Quickshell.Io
import "../../config.js" as Config

Text {
    id: root
    property string ssid: "Disconnected"
    Process {
        id: netStat
        running: true
        command: ["sh", "-c", "nmcli -t -f active,ssid,signal dev wifi | grep '^yes'"]
        stdout: SplitParser {
            onRead: (line) => {
                const parts = line.split(":") 

                if (parts.length >= 3) {
                    root.ssid = parts[1]
                } else {
                    root.ssid = "Disconneceted"    
                }
            }
        }
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: netStat.running = true
    }

    text: {
        if (ssid != "Disconnected") {
            return "󰖩 " + ssid
        }
        else {
            return "󰖪 " + ssid
        }
    }
    font.family: Config.font.fontFamily
    font.pixelSize: Config.font.fontSize
    font.bold: true
    color: "#ffffff"
}
