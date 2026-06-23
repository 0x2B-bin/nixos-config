import QtQuick
import Quickshell.Services.Pipewire
import "../../config.js" as Config

Text {
    id: root
    property bool isMuted: false

    PwObjectTracker {
        objects: [ Pipewire.defaultAudioSink ]
    }

    text: { 
        const icon = root.isMuted ? "󰝟 " : "󰕾 "
        icon + Math.round(Pipewire.defaultAudioSink?.audio.volume/1.5 * 100) + "%"
    }
    font.family: Config.font.fontFamily
    font.pixelSize: Config.font.fontSize
    font.bold: true
    color: "#ffffff"

    Connections {
        target: Pipewire.defaultAudioSink?.audio

        function onVolumeChanged() {
            return
        }

        function onMutedChanged() {
            root.isMuted = Pipewire.defaultAudioSink?.audio.muted
        }
    }
}
