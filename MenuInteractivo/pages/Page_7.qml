import QtQuick

import "./../pages"

Rectangle {
    radius: radiusBox
    //anchors.fill: parent
    color: "#FF02AE"
    Text {
        anchors.centerIn: parent
        id: esd
        text: qsTr("Page 7")
        color: "white"
        font.pixelSize: 30
    }
}
