import QtQuick
import QtQuick.Controls
import "./../pages"

Rectangle {
    anchors.fill: stackItem.parent
    radius: radiusBox
    color: "#ccdbdb"
    // color: "#057FEE"
    ListModel {
        id: pageSubModel
        ListElement {
            fileName: "Page_5.qml"
            displayName: "Page 5"
        }
        ListElement {
            fileName: "Page_6.qml"
            displayName: "Page 6"
        }
        ListElement {
            fileName: "Page_7.qml"
            displayName: "Page 7"
        }
        ListElement {
            fileName: "Page_8.qml"
            displayName: "Page 8"
        }
    }

    Item {
        id: containerSubContent
        height: parent.height
        anchors {
            left: parent.left
            right: buttonContainer.left
        }

        Loader {
            id: pageLoader
            width: 7 * parent.width / 8
            height: 7 * parent.height / 8
            anchors.centerIn: parent

            source: Qt.resolvedUrl(pageSubModel.get(0).fileName)
            onLoaded: {
                if (pageLoader.item !== null) {
                    pageLoader.item.width = width
                    pageLoader.item.height = height
                }
            }
        }
    }

    Item {
        id: buttonContainer
        width: 110
        height: parent.height
        anchors.right: parent.right

        Column {
            spacing: 20
            anchors.centerIn: parent
            width: parent.width

            Repeater {
                model: pageSubModel
                Rectangle {
                    width: parent.width - 5
                    height: 50
                    color: pageLoader.source === Qt.resolvedUrl(
                               model.fileName) ? "#eeee7e" : "#EFEFEF"
                    radius: 10
                    anchors.left: parent.left

                    Text {
                        anchors.centerIn: parent
                        text: model.displayName
                        font.family: "URW Gothic L"
                        font.pixelSize: 16
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (pageLoader.source !== Qt.resolvedUrl(
                                        model.fileName)) {
                                pageLoader.source = Qt.resolvedUrl(
                                            model.fileName)
                            }
                        }
                    }
                }
            }
        }
    }
}
