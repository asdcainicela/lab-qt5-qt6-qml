import QtQuick 2.15
import QtQuick.Controls 2.15

Window {
    width: 800
    height: 480
    visible: true
    title: qsTr("Custom Virtual Keyboard")

    Rectangle {
        id: windowMain
        width: parent.width
        height: parent.height
        color: "#333333"

        Rectangle {
            color: "#555555"
            anchors {
                centerIn: parent
                margins: 10
            }
            height: 50
            width: 90
            radius: 10
            border.color: "#00ffff"
            border.width: 2

            TextInput {
                id: textInput
                width: parent.width - 20 // Ajustado para márgenes internos
                height: parent.height - 10
                anchors.centerIn: parent
                font.pixelSize: parent.height * 0.8
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                inputMethodHints: Qt.ImhDigitsOnly
                cursorVisible: true
                // No hay propiedades como cursorColor o cursorWidth disponibles en QML para TextInput

                // Limitar el texto a dos dígitos y rango de 0 a 12
                onTextChanged: {
                    if (text.length > 2) {
                        text = text.substring(0, 2)
                    }
                    var num = parseInt(text)
                    if (isNaN(num) || num < 0 || num > 12) {
                        text = ""

                    }
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("El TextInput fue clicado")
                textInput.focus = true

                // Mostrar el teclado virtual cuando se hace clic
                keyboardController.show()
            }
        }
    }

    // Declaración del KeyboardController
    KeyboardController {
        id: keyboardController
        target: textInput
        rootObject: windowMain
        // Puedes añadir más configuraciones si es necesario
    }
}
}
