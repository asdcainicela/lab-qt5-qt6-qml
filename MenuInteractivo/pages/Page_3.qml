import QtQuick
import "./../pages"

Rectangle {
    anchors.fill: parent
    radius: radiusBox
    color: "#ccdbdb"
    Text {
        anchors.centerIn: parent
        id: esd
        text: qsTr("Page 3")
        color: "white"
        font.pixelSize: 30
    }
}
