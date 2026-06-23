import Quickshell
 import Quickshell.Io
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts
import "config.js" as Config


Scope {
    id: root
    property bool centerOpen: false
    ListModel { id: history }

    NotificationServer {
        id: server
        imageSupported: true
        actionsSupported: true
        bodySupported: true

        onNotification: n => {
            history.insert(0,{
                summary: n.summary,
                body: n.body,
                appName: n.appName,
                urgency: n.urgency,
                time: Qt.formatDateTime(new Date(), "HH:mm")
            })
            n.tracked = true
        }
    }

    IpcHandler {
        target: "notifications"
        function toggle(): void { root.centerOpen = !root.centerOpen }
        function show(): void { root.centerOpen = true }
        function hide(): void { root.centerOpen = false }
    }

    PanelWindow {
        visible: root.centerOpen
        anchors {
            top: true
            right: true
        }

        margins {
            top: 35
            right: 12
        }

        implicitWidth: 330
        implicitHeight: centerCol.implicitHeight + 20
        color: "transparent"

        exclusionMode: ExclusionMode.Ignore

        Rectangle {
            anchors.fill: parent
            color: Config.colors.bg
            border.width: 2
            border.color: Config.colors.color0
            radius: 8

            ColumnLayout {
                id: centerCol
                anchors.fill: parent
                anchors.margins: 12
                spacing: 10


                RowLayout {
                    Layout.fillWidth: true
                    Text {
                        Layout.fillWidth: true
                        text: "Notifications"
                        color: Config.colors.color0
                        font.family: Config.notifications.fontFamily
                        font.pixelSize: 16
                        font.bold: true
                    }
                    Text {
                        text: "Clear all"
                        visible: history.count > 0
                        color: Config.colors.color0
                        font.family: Config.notifications.fontFamily
                        font.pixelSize: 14

                        MouseArea {
                            anchors.fill: parent
                            onClicked: history.clear()
                        }
                    }
                }

                Text {
                    Layout.alignment: Qt.AlignHCenter
                    visible: history.count === 0
                    text: "No notifications"
                    color: "white"
                    font.family: Config.notifications.fontFamily
                }

                ColumnLayout {
                    id: cardCol
                    Layout.fillWidth: true
                    spacing: 2

                    Repeater {
                        model: history

                        Rectangle {
                            Layout.fillWidth: true
                            implicitHeight: cardLayout.implicitHeight + 24
                            color: "black"
                            radius: 8
                            border.color: "#222222"

                            required property var modelData

                            RowLayout {
                                id: cardLayout
                                anchors.fill: parent
                                anchors.margins: 12
                                spacing: 3

                                ColumnLayout {
                                    spacing: 2
                                    Layout.fillWidth: true
                                    Text {
                                        text: modelData.summary || ""
                                        font.bold: true
                                        color: "white"
                                        elide: Text.ElideRight
                                        font.family: Config.notifications.fontFamily
                                    }
                                    Text {
                                        text: modelData.body || ""
                                        wrapMode: Text.WordWrap
                                        color: "white"
                                        visible: text !== ""
                                        font.family: Config.notifications.fontFamily
                                    }
                                    Text {
                                        text: modelData.appName || ""
                                        color: "white"
                                        elide: Text.ElideRight
                                        font.family: Config.notifications.fontFamily
                                    }
                                }

                                ColumnLayout {
                                    Text {
                                        text: modelData.time || ""
                                        color: "white"
                                        elide: Text.ElideRight
                                        font.family: Config.notifications.fontFamily
                                    }
                                }
                            }
                        }
                    }
                }

                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
        }
    }

    PanelWindow {
        anchors {
            top: true
            right: true
        }

        margins {
            top: 35
            right: 12
        }

        implicitWidth: 330
        implicitHeight: Math.max(1, column.implicitHeight)
        color: "transparent"

        exclusionMode: ExclusionMode.Ignore

        ColumnLayout {
            id: column
            width: parent.width
            spacing: 10

            Repeater {
                model: server.trackedNotifications

                Rectangle {
                    id: card
                    required property var modelData

                    Timer {
                        interval: Config.notifications.timeout
                        running: card.modelData.urgency !== NotificationUrgency.Critical
                        onTriggered: card.modelData.dismiss()
                    }

                    Layout.fillWidth: true
                    Layout.preferredHeight: 60
                    //Layout.preferredHeight: layout.implicitHeight + 20
                    radius: 8
                    color: Config.colors.bg
                    border.width: 3
                    border.color: Config.colors.color0

                    RowLayout {
                        id: layout
                        anchors.fill: parent
                        anchors.margins: 1
                        spacing: 10

                        Image {
                            Layout.preferredHeight: 36
                            Layout.preferredWidth: 36
                            Layout.alignment: Qt.AlignHCenter
                            fillMode: Image.PreserveAspectFit
                            visible: source.toString() !== ""
                            source: card.modelData.image || card.modelData.appIcon || ""
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 2

                            Text {
                                Layout.fillWidth: true
                                text: card.modelData.summary
                                color: Config.colors.color0
                                font.family: Config.notifications.fontFamily
                                font.pixelSize: Config.notifications.fontSize
                                font.bold: true
                                elide: Text.ElideRight
                            }
                            Text {
                                Layout.fillWidth: true
                                visible: text != ""
                                text: card.modelData.body
                                color: "white"
                                font.family: Config.notifications.fontFamily
                                font.pixelSize: Config.notifications.fontSize - 1
                                font.bold: true
                                wrapMode: Text.WordWrap
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: card.modelData.dismiss()
                    }
                }
            }
        }
    }
}
