import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import "../../config.js" as Config

Item {
    id: root
    property string monitorName: ""
    property var workspaces: []
    property int activeWorkspace: -1
    property int hPadding: 15
    property int vPadding: 3

    readonly property int workspaceCount: workspaces.length

    implicitWidth: workspaceRow.implicitWidth + hPadding
    implicitHeight: workspaceRow.implicitHeight + vPadding

    Process {
        id: niriIpc
        command: ["niri", "msg", "--json", "event-stream"]
        running: true
        stdout: SplitParser {
            onRead: line => {
                let event = JSON.parse(line)

                if (event.WorkspacesChanged || event.WorkspaceActivated) {
                    fetchWorkspaces.running = true
                }
            }
        }
    }

    Process {
        id: fetchWorkspaces
        command: ["niri", "msg", "--json", "workspaces"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                let workspacesJson = JSON.parse(text)
                let tempWorkspaces = []

                for (let i = 0; i < workspacesJson.length; i++) {
                    let workspace = workspacesJson[i]

                    if (workspace["output"] == root.monitorName) {
                        if (workspace["is_active"]) {
                            root.activeWorkspace = workspace["idx"]
                        }
                        tempWorkspaces.push(workspace)
                    }
                }
                tempWorkspaces.sort((a, b) => a.idx - b.idx)
                root.workspaces = tempWorkspaces
            }
        }
    }

    Process {
        id: niriAction
    }

    Rectangle {
        id: background
        width: workspaceRow.implicitWidth + root.hPadding
        height: workspaceRow.implicitHeight + root.vPadding

        radius: 50
        color: "#262626"

        RowLayout {
            id: workspaceRow
            spacing: 6
            anchors.fill: parent

            anchors.rightMargin: root.hPadding / 2
            anchors.leftMargin: root.hPadding / 2
            anchors.topMargin: root.vPadding / 2
            anchors.bottomMargin: root.vPadding / 2

            Text {
                text: root.activeWorkspace
                color: "white"
                Layout.rightMargin: 2
                Layout.alignment: Qt.AlignVCenter
                font.family: Config.font.fontFamily
                font.pixelSize: Config.font.fontSize
                font.bold: true
            }

            Repeater {
                model: root.workspaceCount
                Rectangle {
                    readonly property var workspaceData: root.workspaces[index]
                    readonly property bool isActiveWorkspace: workspaceData.is_active

                    Layout.preferredWidth: (isActiveWorkspace ? 30 : 20)
                    Layout.preferredHeight: (isActiveWorkspace ? 11 : 7)
                    color: (isActiveWorkspace ? Config.colors.color0 : "#ffffff") || "#ffffff"
                    radius: 50

                    Layout.alignment: Qt.AlignCenter

                    Behavior on color { ColorAnimation { duration: 100 } }
                    Behavior on Layout.preferredWidth {
                        NumberAnimation {
                            duration: 100
                            easing.type: Easing.InOutQuad
                        }
                    }
                    Behavior on Layout.preferredHeight {
                        NumberAnimation {
                            duration: 100
                            easing.type: Easing.InOutQuad
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            niriAction.command = ["niri", "msg", "action", "focus-workspace", modelData.idx.toString()];
                            niriAction.running = true
                        }
                    }
                }
            }
        }
    }
}
