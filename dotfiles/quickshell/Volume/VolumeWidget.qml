import Quickshell
import Quickshell.Services.Pipewire
import QtQuick.Layouts
import QtQuick
import Quickshell.Widgets
import "../config.js" as Config

Scope {
    id: root

    PwObjectTracker {
        objects: [ Pipewire.defaultAudioSink ]
    }

    Connections {
        target: Pipewire.defaultAudioSink?.audio

        function onVolumeChanged() {
            root.shouldShow = true
            hideTimer.restart();
        }

        function onMutedChanged() {
            root.shouldShow = true
            hideTimer.restart();
        }
    }

    Timer {
        id: hideTimer
        interval: 1000
        onTriggered: root.shouldShow = false
    }

    property bool shouldShow: false

    LazyLoader {
        active: root.shouldShow

        PanelWindow {
            anchors.bottom: true
            margins.bottom: screen.height / 10
            exclusiveZone: 0


            implicitHeight: 50
            implicitWidth: 400
            color: "transparent"

            Rectangle {
                anchors.fill: parent
                radius: height / 2
                color: "#c0000000"

                RowLayout {
                    anchors {
                        leftMargin: 15
                        rightMargin: 15
                        fill: parent
                    }
                    
                    spacing: 10

                    IconImage {
                        implicitSize: 30
                        source: {
                            if (Pipewire.defaultAudioSink.audio.muted) {
                                return Quickshell.iconPath("/home/nate/.config/quickshell/Volume/volume_mute.png")
                            }
                            else {
                                return Quickshell.iconPath("/home/nate/.config/quickshell/Volume/volume_up.png")
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true

                        implicitHeight: 10
                        radius: 20
                        color: "#50ffffff"

                        Rectangle {
                            anchors {
                                left: parent.left
                                top: parent.top
                                bottom: parent.bottom
                            }

                            implicitWidth: parent.width * Math.min((Pipewire.defaultAudioSink?.audio.volume ?? 0)/1.5, 1.0)
                            radius: parent.radius
                            color: Config.colors.color0 || "#ffffff"
                        }
                    }

                    Text {
                        text: Math.round((Pipewire.defaultAudioSink?.audio.volume ?? 0)/1.5 * 100) + "%"
                        color: "#ffffff"
                        font.pixelSize: 13
                    }

                    
                }
                
            }
        }
    }
}
