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
            left: parent.left
            right: parent.right
            leftMargin: 5
            rightMargin: 5
        }
        width: parent.width
        height: 60

        TextEdit {
            id: displayScreenTextEdit
            anchors.fill: parent
            focus: true
        }
    }
}