import Quickshell
import QtQuick
import QtQuick.Layouts
import "../config.js" as Config
import "Time"
import "Memory"
import "Cpu"
import "Workspaces"
import "Battery"
import "Network"
import "Volume"


PanelWindow {
    id: barRoot
    required property var modelData
    property var gamepopupHandle

    screen: modelData

    anchors {
        left: true
        right: true
        top: true
    }

    implicitHeight: 30
    color: "transparent"

    Rectangle {
        id: barSurface

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        width: parent.width - 100
        color: Config.colors.bg
        radius: 12
        topLeftRadius: 0
        topRightRadius: 0

        RowLayout {
            anchors.left: parent.left
            anchors.leftMargin: 17
            anchors.verticalCenter: parent.verticalCenter

            /*
            Item {
                implicitWidth: 20
                implicitHeight: 20
                Text {
                    anchors.centerIn: parent
                    text: "󰋜"
                    color: "white"
                    font.family: Style.fontFamily
                    font.pixelSize: Style.fontSize
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        barRoot.gamepopupHandle.visible = !barRoot.gamepopupHandle.visible;
                    }
                }
            }
            */
            WorkspacesWidget {
                monitorName: modelData.name
            }
        }

        RowLayout {
            anchors.centerIn: parent
            TimeWidget {}
        }

        RowLayout {
            anchors.right: parent.right
            anchors.rightMargin: 17
            anchors.verticalCenter: parent.verticalCenter
            spacing: 7

            VolumeWidget {}
            SepWidget {}
            NetworkWidget {}
            SepWidget {}
            CpuWidget {}
            SepWidget {}
            MemWidget {}
            SepWidget {
                visible: bat.hasBattery
            }
            BatteryWidget {
                id: bat
            }
        }
    }
}
