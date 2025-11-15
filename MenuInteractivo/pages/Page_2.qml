import QtQuick
import "./../pages"

Rectangle {
    anchors.fill: stackItem.parent
    radius: radiusBox
   color: "#ccdbdb"
    Text {
        anchors.centerIn: parent
        id: esd
        text: qsTr("Page 1")
        color: "white"
        font.pixelSize: 30
    }
}
