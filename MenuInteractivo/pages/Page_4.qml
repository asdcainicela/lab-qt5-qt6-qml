import QtQuick

Rectangle {
    anchors.fill: parent
    radius: radiusBox
   color: "#ccdbdb"
    Text {
        anchors.centerIn: parent
        id: esd
        text: qsTr("Page 4")
        color: "white"
        font.pixelSize: 30
    }
}
