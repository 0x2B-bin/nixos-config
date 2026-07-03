import Quickshell
import QtQuick
import "Bar"
import "Volume"
import "GamePopup"
import "Launcher"

ShellRoot {
    VolumeWidget {}
    Launcher {}
    Variants {
        model: Quickshell.screens

        Component {
            Bar {
                modelData: modelData
                gamepopupHandle: gamePopup
            }
        }
    }
}
