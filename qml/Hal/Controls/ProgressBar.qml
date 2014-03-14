import QtQuick 2.0
import QtQuick.Controls 1.1
import Hal 1.0 as HAL

ProgressBar {
    property string name: "progressBar"
    property bool showText: true

    id: main

    HAL.Pin {
        id: pin

        name: main.name
        type: HAL.Pin.HAL_FLOAT
        direction: HAL.Pin.HAL_IN
    }

    HAL.Pin {
        id: pinScale

        name: main.name + ".scale"
        type: HAL.Pin.HAL_FLOAT
        direction: HAL.Pin.HAL_IN
    }

    Text {
        id: progressText

        anchors.centerIn: parent
        text: main.value
        visible: main.showText
    }

    Binding { target: main; property: "value"; value: pin.value}
    Binding { target: main; property: "maximumValue"; value: pinScale.value}
}
