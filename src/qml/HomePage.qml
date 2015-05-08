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

    property bool isLastElementOperator: false

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
        id: topRowOperatorGrid
        anchors {
            right: parent.right
            top: displayScreen.bottom
            topMargin: 10
            bottomMargin: 10
            rightMargin: 10
        }
        spacing: 15
        columns: 4

        Repeater {
            id: topRowOperatorRepeater
            model: ["(", ")", "%", "CE"]

            Button {
                id: topROperatorButton

                style: ButtonStyle {
                    id: topRowOperatorButtonStyle
                    background: Rectangle {
                        id: topRowOperatorButtonStyleRectangle
                        color: "white"
                        implicitHeight: 40
                        implicitWidth: 40
                        radius: 8
                    }
                    label: Text {
                        id: topRowOperatorButtonLabel
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
                    if( modelData == "CE" ) {
                        displayScreenTextEdit.remove(0, displayScreenTextEdit.length)
                    } else if( isLastElementOperator ) {
                        console.log("Error: Invalid expression")
                    } else {
                        displayScreenTextEdit.insert(displayScreenTextEdit.length, modelData)
                        if( modelData == "%" )
                            isLastElementOperator = true;
                    }
                }
            }
        }
    }

    Grid {
        id: rightColumnOperatorGrid
        anchors {
            right: parent.right
            top: topRowOperatorGrid.bottom
            topMargin: 20
            bottomMargin: 20
            rightMargin: 10
        }
        spacing: 15
        columns: 1

        Repeater {
            id: rightColumnOperatorRepeater
            model: ["/", "X", "-", "+"]

            Button {
                id: rightColumnOperatorButton

                style: ButtonStyle {
                    id: rightColumnOperatorButtonStyle
                    background: Rectangle {
                        id: rightColumnOperatorButtonStyleRectangle
                        color: "white"
                        implicitHeight: 40
                        implicitWidth: 40
                        radius: 8
                    }
                    label: Text {
                        id: rightColumnOperatorButtonLabel
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
                    if( isLastElementOperator ) {
                        console.log("Error: Invalid expression")
                    } else {
                        displayScreenTextEdit.insert(displayScreenTextEdit.length, modelData)
                        isLastElementOperator = true
                    }
                }
            }
        }
    }

    Grid {
        id: numberGrid
        anchors {
            right: rightColumnOperatorGrid.left
            top: rightColumnOperatorGrid.top
            bottomMargin: 20
            rightMargin: 5
        }
        width: parent.width / 5
        spacing: 15
        columns: 3

        Repeater {
            id: numberRepeater
            model: ["7", "8", "9", "4", "5", "6", "1", "2", "3", "0", ".", "="]

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
                    if( modelData == "=" ) {
                        //TODO: solve the expression
                    } else if( displayScreenTextEdit.getText( displayScreenTextEdit.length - 1, displayScreenTextEdit.length ) == "." ) {
                        console.log("Invalid expression")
                    } else {
                        displayScreenTextEdit.insert(displayScreenTextEdit.length, modelData)
                        isLastElementOperator = false
                    }
                }
            }
        }
    }
}