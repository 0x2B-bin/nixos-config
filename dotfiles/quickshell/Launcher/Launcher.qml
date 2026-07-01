import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import ".."

PanelWindow {
    id: launcher

    implicitWidth: 700
    implicitHeight: 500

    exclusionMode: ExclusionMode.Ignore

    WlrLayershell.layer: WlrLayer.Top
    //WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

    color: "transparent"


    anchors {
        bottom: true
    }

    Rectangle {
        visible: true
        anchors.fill: parent
        color: "#191717"
        topRightRadius: 7
        topLeftRadius: 7
        //border.color: Style.pcolor
        //border.width: 2

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
            }

            ListView {
                Layout.fillHeight: true
            }
        }
    }

}
