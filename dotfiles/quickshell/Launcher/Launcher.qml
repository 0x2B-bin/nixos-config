import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "../config.js" as Config

PanelWindow {
    id: launcher

    implicitWidth: 700
    implicitHeight: 500
    property bool isOpen: false
    visible: isOpen || slideAnimation.running
    exclusionMode: ExclusionMode.Ignore

    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.keyboardFocus: isOpen ? WlrKeyboardFocus.Exclusive : WlrKeyboardFocus.None

    color: "transparent"

    property string query: ""

    anchors {
        bottom: true
    }

    IpcHandler {
        target: "app-launcher"

        function toggle() {
            launcher.isOpen = !launcher.isOpen

            if (launcher.isOpen) {
                searchInput.text = "";
                searchInput.forceActiveFocus();
            } else {
                appList.currentIndex = 0
            }
        }
    }

    ScriptModel {
        id: filtered
        values: { 
            const allEntries = [...DesktopEntries.applications.values].sort()
            const q = launcher.query.trim().toLowerCase()

            if (q === "") {
                return allEntries.sort((a, b) => a.name.localeCompare(b.name))
            } else {
                return allEntries.filter(d => d.name && d.name.toLowerCase().includes(q)).sort((a, b) => a.name.localeCompare(b.name))
            }
        }
    }

    function launchSelected() {
        if (appList.currentItem && appList.currentItem.modelData)  {
            appList.currentItem.modelData.execute()
            appList.currentIndex = 0
            launcher.isOpen = false
        }
    }

    Rectangle {
        id: contentRoot
        width: launcher.width
        height: launcher.height
        y: launcher.isOpen ? 0 : launcher.height
        color: "#191717"
        topRightRadius: 7
        topLeftRadius: 7

        Behavior on y {
            NumberAnimation {
                id: slideAnimation
                duration: 250
                easing.type: Easing.OutCubic
            }
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 5
            spacing: 10

            TextField {
                id: searchInput
                Layout.fillWidth: true
                font.pixelSize: 15
                background: Rectangle {
                    color: "#100f0f"
                    radius: 4
                }
                placeholderText: "Run..."
                placeholderTextColor: "#555555"
                color: "white"
                focus: true

                onTextChanged: {
                    launcher.query = text;
                    appList.currentIndex = filtered.values.length > 0 ? 0 : -1;
                }
            }
            Keys.onEscapePressed: {
                launcher.isOpen = false
                appList.currentIndex = 0
            }

            Keys.onPressed: (event) => {
                if (event.key === Qt.Key_Down) {
                    event.accepted = true;
                    if (appList.currentIndex < appList.count - 1) {
                        appList.currentIndex += 1
                    }
                } else if (event.key === Qt.Key_Up && filtered.values.length > 0) {
                    event.accepted = true;
                    if (appList.currentIndex > 0) {
                        appList.currentIndex -= 1
                    }
                } else if ([Qt.Key_Return, Qt.Key_Enter].includes(event.key)) {
                    launcher.launchSelected()
                    event.accepted = true;
                }
            }

            ListView {
                id: appList
                Layout.fillHeight: true
                Layout.fillWidth: true
                spacing: 5
                clip: true
                currentIndex: filtered.values.length > 0 ? 0 : -1
                keyNavigationWraps: true
                model: filtered

                delegate: Item {
                    id: entry
                    required property var modelData
                    required property int index
                    implicitWidth: appList.width
                    height: 50

                    Rectangle {
                        anchors.fill: parent
                        radius: 8
                        color: "#262626"
                        border.width: 2
                        border.color: appList.currentIndex == entry.index ? Config.colors.color0 : "#262626"

                        Row {
                            anchors.fill: parent
                            anchors.margins: 8
                            spacing: 12

                            Image {
                                anchors.verticalCenter: parent.verticalCenter
                                width: 28
                                height: 28
                                source: modelData.icon ? "image://icon/" + modelData.icon : ""
                                fillMode: Image.PreserveAspectFit
                            }

                            Column {
                                anchors.verticalCenter: parent.verticalCenter
                                Text {
                                    text: modelData.name
                                    color: Config.colors.color0 || "white"
                                    font.family: "JetBrainsMono Nerd Font"
                                    font.pixelSize: 14
                                    font.bold: true
                                    horizontalAlignment: Text.AlignLeft
                                }
                                Text {
                                    text: modelData.comment || " "
                                    color: "white"
                                    font.family: "JetBrainsMono Nerd Font"
                                    font.pixelSize: 11
                                    horizontalAlignment: Text.AlignLeft
                                }
                            }
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                    }
                }
            }
        }
    }
}
