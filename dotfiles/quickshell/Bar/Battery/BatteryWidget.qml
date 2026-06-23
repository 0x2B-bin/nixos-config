import Quickshell
import Quickshell.Io
import QtQuick
import "../../config.js" as Config

Text {
    id: batteryWidget
    property int batteryLevel: 0
    property bool batteryCharging: false
    property bool hasBattery: false

    visible: hasBattery

    text: {
        const icons = ["󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"]
        const chargingIcons = ["󰢜", "󰂆", "󰂇", "󰂈", "󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅"]
        const index = Math.max(0, Math.min(Math.floor(batteryLevel / 10), 9))

        const selectedIcon = batteryCharging ? chargingIcons[index] : icons[index]
        selectedIcon + " " + batteryLevel.toString() + "%"
    }
    

    font.family: Config.font.fontFamily
    font.pixelSize: Config.font.fontSize
    font.bold: true
    color: {
        if (batteryCharging) {
            return Config.colors.colors0 || "#46e041"
        }
        if (batteryLevel < 10) {
            return "#ff5555"
        }
        else {
            return "#ffffff"
        }
    }

    Process {
        id: checkBatteryPresence
        command: ["sh", "-c", "test -d /sys/class/power_supply/BAT0/ || test -d /sys/class/power_supply/BAT1/ && echo 'true' || echo 'false'"]
        stdout: SplitParser {
            onRead: data => {
                batteryWidget.hasBattery = (data.trim() === "true")
            }
        }
        Component.onCompleted: running = true
    }

    Process {
        id: fetchBattery     
        command: ["sh", "-c", "cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || cat /sys/class/power_supply/BAT1/capacity 2>/dev/null"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                batteryWidget.batteryLevel = parseInt(data.trim()) || 0
            }
        }

        Component.onCompleted: running = true
    }

    Process {
        id: batteryStatus
        command: ["sh", "-c", "cat /sys/class/power_supply/BAT0/status 2>/dev/null || cat /sys/class/power_supply/BAT1/status 2>/dev/null"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                batteryWidget.batteryCharging = (data.trim() === "Charging" || data.trim() === "Full")
            }
        }
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            fetchBattery.running = true 
            batteryStatus.running = true
        }
    }
}
