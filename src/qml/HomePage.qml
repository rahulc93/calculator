import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2
import QtQuick.Window 2.2
import QtMultimedia 5.0
import QtQml 2.2

Item {

    id: homePage
    focus: true

    anchors.fill: parent

    Rectangle {
        id: displayScreen
        anchors {
            top: parent.top
            right: parent.right
            leftMargin: 5
            rightMargin: 5
            topMargin: 10
        }
        width: parent.width / 2
        height: 60

        TextEdit {
            id: displayScreenTextEdit
            anchors.fill: parent
            focus: true
        }
    }

    Grid {
        id: numberGrid
        anchors {
            right: parent.right
            top: displayScreen.bottom
            topMargin: 10
            bottomMargin: 20
        }
        width: parent.width / 5
        spacing: 15
        columns: 3

        Repeater {
            id: numberRepeater
            model: ["7", "8", "9", "4", "5", "6", "1", "2", "3", "0", "."]

            Button {
                id: numberButton

                style: ButtonStyle {
                    id: numberButtonStyle
                    background: Rectangle {
                        id: numberButtonStyleRectangle
                        color: "white"
                        implicitHeight: 40
                        implicitWidth: 40
                        radius: 8
                    }
                    label: Text {
                        id: numberButtonLabel
                        anchors.centerIn: parent
                        text: modelData
                        font.family : "Arial"
                        font.capitalization : Font.AllUppercase
                        font.weight : Font.Bold
                        horizontalAlignment : Text.AlignHCenter
                        verticalAlignment : Text.AlignVCenter
                    }
                }

                onClicked: {
                    //console.log("Button clicked: " + modelData)
                    displayScreenTextEdit.insert(displayScreenTextEdit.length, modelData)
                }
            }
        }
    }
}