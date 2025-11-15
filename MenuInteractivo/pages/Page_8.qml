import QtQuick

import "./../pages"

Rectangle {
    radius: radiusBox
    //anchors.fill: parent
    color: "#FFFF00"
    Text {
        anchors.centerIn: parent
        id: esd
        text: qsTr("Page 8")
        color: "white"
        font.pixelSize: 30
    }
}
