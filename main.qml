import QtQuick 2.12
import QtQuick.Window 2.12
import QtCharts 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import "components"

Window {
    title: qsTr("My super app")
    width: 1024
    height: 768
    visible: true

    GridLayout {
        id: grid
        width: parent.width
        height: parent.height
        anchors.fill: parent
        anchors.centerIn: parent
        rowSpacing: 0
        columnSpacing: 0
        rows: 8
        columns: 1

        property double colMulti : grid.width / grid.columns
        property double rowMulti : grid.height / grid.rows

        function prefWidth(item){
            return colMulti * item.Layout.columnSpan
        }

        function prefHeight(item){
            return rowMulti * item.Layout.rowSpan
        }

        Rectangle {
            id: menu
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
            //color: "black"
            //border.color: "black"

            RowLayout {
                id: menu_btns
                anchors.fill: menu
                spacing: 0

                Rectangle {
                    id: statisticBtn
                    Layout.minimumWidth: 100
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 100
                    Layout.fillWidth: true
                    color: "#202120"

                    Text {
                        anchors.centerIn: parent
                        text: "Statistic"
                        color: "#C7C9C7"
                        font.pixelSize: 22
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            statisticView.visible = true
                            remoteNodesStatusView.visible = false

                            statisticBtn.color = "#191919"
                            remoteNodesStatusBtn.color = "#202120"
                        }
                    }
                }

                Rectangle  {
                    id: remoteNodesStatusBtn
                    color: "#191919"
                    Layout.minimumWidth: 100
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 100
                    Layout.fillWidth: true

                    Text {
                        anchors.centerIn: parent
                        text: "Remote nodes status"
                        color: "#C7C9C7"
                        font.pixelSize: 22
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            statisticView.visible = false
                            remoteNodesStatusView.visible = true

                            statisticBtn.color = "#202120"
                            remoteNodesStatusBtn.color = "#191919"
                        }
                    }
                }
            }

        }

        Rectangle {
            id: statisticView
            Layout.columnSpan: 1
            Layout.rowSpan: 7
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
            visible: false
            color: "#191919"
            //border.color: "black"

            Text {
                text: "statisticView"
            }
        }

        Rectangle {
            id: remoteNodesStatusView
            Layout.columnSpan: 1
            Layout.rowSpan: 7
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
            //Layout.topMargin: 20
            //Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            //color: "black"
            color: "#191919"
            //border.color: "black"

            ColumnLayout {
                anchors.fill: parent
                //anchors.centerIn: parent
                anchors.margins: 20

//                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 0

                GridLayout {
//                    Layout.fillWidth: true
//                    Layout.fillHeight:  true
                    Layout.alignment: Qt.AlignTop
                    columns: implicitW < parent.width ? -1 : parent.width / columnImplicitWidth
                    rowSpacing: 20
                    columnSpacing: 20
                    anchors.horizontalCenter: parent.horizontalCenter

//                    anchors.margins: 20
//                    Layout.topMargin: 20
//                    anchors.topMargin: 20
                    //anchors.fill: parent
                    //anchors.centerIn: parent

                    property int columnImplicitWidth: children[0].implicitWidth + columnSpacing
                    property int implicitW: (repeater.count + 1) * columnImplicitWidth

    //                Rectangle {
    //                    Layout.fillWidth: true
    //                    Layout.fillHeight:  true
    //                    implicitHeight: 200
    //                    implicitWidth: 200
    //                    Layout.topMargin: 20
    //                }

    //                Repeater {
    //                    id: repeater
    ////                    model: slider.value
    ////                    delegate: Rectangle {
    ////                        implicitWidth: 40
    ////                        implicitHeight: 60
    ////                        color: "transparent"
    ////                        border.color: "darkorange"
    ////                    }
    //                }

                    Repeater {
//                        Layout.fillWidth: true
//                        Layout.fillHeight:  true
//                        Layout.topMargin: 20
//                        anchors.topMargin: 20
                        id: repeater
                        //model: ["root", "item1","subitem1","one more items"]
                        model: ListModel {
                            id: repModel
                            ListElement { title: "Node 1"; status: "online"; ip: "192.168.0.2"; ping: "0.5ms" }
                            ListElement { title: "Node 2"; status: "offline"; ip: "192.168.0.3"; ping: "?" }
                            ListElement { title: "Node 3"; status: "offline"; ip: "192.168.0.4"; ping: "?" }

                        }

                        delegate: Rectangle {
                            implicitWidth: 200
                            implicitHeight: 175
                            radius: 15
                            color: "#202120"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("hello")
                                }

                            }

                            ColumnLayout {
                                anchors.fill: parent
                                anchors.centerIn: parent
                                spacing: 0
                                // anchors{
                                //     horizontalCenter: parent.horizontalCenter
                                //     verticalCenter: parent.verticalCenter
                                // }

                                RowLayout {
                                    Layout.fillWidth: true
                                    Text {
                                        Layout.fillWidth: true
                                        bottomPadding: 0
                                        padding: 10
                                        text: title
                                        // anchors.fill: parent
                                        // anchors.centerIn: parent
                                        Layout.alignment: Qt.AlignHCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        color: "#C7C9C7"
                                        font.pixelSize: 20
                                    }

                                    Rectangle {
                                        width: 20
                                        height: 20
                                        color: (status == "offline") ? "#7E4437" : "#49685D"
                                        radius: 20
                                        Layout.rightMargin: 15
                                    }
                                }


                                Text {
                                    Layout.fillWidth: true
                                    topPadding: 0
                                    leftPadding: 10
                                    bottomPadding: 0
                                    padding: 10
                                    text: "Status: " + status
                                    // anchors.fill: parent
                                    // anchors.centerIn: parent
                                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                                    color: "#C7C9C7"
                                    font.pixelSize: 20
                                }

                                Text {
                                    Layout.fillWidth: true
                                    topPadding: 0
                                    leftPadding: 10
                                    bottomPadding: 0
                                    padding: 10
                                    text: "IP: " + ip
                                    // anchors.fill: parent
                                    // anchors.centerIn: parent
                                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                                    color: "#C7C9C7"
                                    font.pixelSize: 20
                                }

                                Text {
                                    Layout.fillWidth: true
                                    topPadding: 0
                                    leftPadding: 10
                                    bottomPadding: 10
                                    padding: 10
                                    text: "Ping: " + ping
                                    // anchors.fill: parent
                                    // anchors.centerIn: parent
                                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                                    color: "#C7C9C7"
                                    font.pixelSize: 20
                                }
                            }
                        }
                    }

                    Rectangle {
                        implicitWidth: 200
                        implicitHeight: 175
                        radius: 15
                        color: "#202120"
                        Text {
                            anchors.centerIn: parent
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: qsTr("add")
                            color: "#C7C9C7"
                        }

                        MouseArea {
                            anchors.fill: parent

                            onClicked: {
                                dialog1.visible = true
                                //repModel.append({title: "Node 5", status: "offline", ip: "192.168.0.6", ping: "?"})
                            }
                        }
                    }

                    Dialog {
                        id: dialog
                        width: 200
                        height: 200
                        visible: false
                        //title: "Title"
                        //standardButtons: Dialog.Ok | Dialog.Cancel
                        //anchors.centerIn: parent
                        //Layout.alignment:
                        parent: Overlay.overlay
                        //Layout.verticalCenter: Qt.AlignVCenter
                        x: (parent.width - width) / 2
                        y: (parent.height - height) / 2
                        modal: true

                        onAccepted: console.log("Ok clicked")
                        onRejected: console.log("Cancel clicked")

                    }

                    Popup1 {
                        id: dialog1
                        parent: Overlay.overlay
                        x: (parent.width - width) / 2
                        y: (parent.height - height) / 2
                        width: 200
                        height: 200
                        text: 'Select status'
                        buttons: ['No', 'Yes']
                        visible: false

                        Overlay.modal: Rectangle {
        color: "#aacfdbe7"
    }
                    
                        onClicked: {
                            if (index == 0) {
                                visible = false
                            } else {
                                repModel.append({title: "Node 5", status: current, ip: "192.168.0.6", ping: "?"})
                                visible = false
                            }
                        }
                    }

                    Popup {
                        width: 200
                        height: 200
                        parent: Overlay.overlay
                        x: (parent.width - width) / 2
                        y: (parent.height - height) / 2
                        visible: true
                        modal: true

                        MouseArea { anchors.fill: parent }

                        

                        contentItem: Text {
                            text:"hello"
                        }
                        
                        background: Rectangle {
                            color: "red"
                            radius: 10
                
                        }
                    }

                    // ComboBox {
                    //     width: 200
                    //     model: [ "Banana", "Apple", "Coconut" ]
                    // }
                }
            }



//            Flow {
//                //visible: false
//                id: f
//                spacing: 20
////                Layout.fillWidth: true
////                Layout.fillHeight: true
////                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
//                //Layout.leftMargin: 100
//                //anchors.centerIn: parent
////                anchors.fill: parent
////                anchors.centerIn: parent
////                anchors.margins: 20
//                // anchors.horizontalCenter: parent.horizontalCenter
//                //Layout.alignment: Qt.AlignHCenter
////                 property int rowCount: parent.width / (elements.itemAt(0).width + spacing)
////                 property int rowWidth: rowCount * elements.itemAt(0).width + (rowCount - 1) * spacing
////                 property int mar: (parent.width - rowWidth) / 2
////                 anchors {
////                     fill: parent
////                     leftMargin: mar
////                     rightMargin: mar
////                 }


//                Repeater {
//                    //model: ["root", "item1","subitem1","one more items"]
//                    model: ListModel {
//                        id: repModel
//                        ListElement { title: "Node 1"; status: "online"; ip: "192.168.0.2"; ping: "0.5ms" }
//                        ListElement { title: "Node 2"; status: "offline"; ip: "192.168.0.3"; ping: "?" }
//                        ListElement { title: "Node 3"; status: "offline"; ip: "192.168.0.4"; ping: "?" }
//                        ListElement { title: "Node 4"; status: "online"; ip: "192.168.0.5"; ping: "1ms" }
//                        ListElement { title: "Node 5"; status: "offline"; ip: "192.168.0.6"; ping: "?" }
//                    }

//                    delegate: Rectangle {
//                        width: 200
//                        height: 175
//                        radius: 15
//                        color: "#202120"

//                        MouseArea {
//                            anchors.fill: parent
//                            onClicked: {
//                                console.log("hello")
//                            }

//                        }

//                        ColumnLayout {
//                            anchors.fill: parent
//                            anchors.centerIn: parent
//                            spacing: 0
//                            // anchors{
//                            //     horizontalCenter: parent.horizontalCenter
//                            //     verticalCenter: parent.verticalCenter
//                            // }

//                            RowLayout {
//                                Layout.fillWidth: true
//                                Text {
//                                    Layout.fillWidth: true
//                                    bottomPadding: 0
//                                    padding: 10
//                                    text: title
//                                    // anchors.fill: parent
//                                    // anchors.centerIn: parent
//                                    Layout.alignment: Qt.AlignHCenter
//                                    horizontalAlignment: Text.AlignHCenter
//                                    color: "#C7C9C7"
//                                    font.pixelSize: 20
//                                }

//                                Rectangle {
//                                    width: 20
//                                    height: 20
//                                    color: (status == "offline") ? "#7E4437" : "#49685D"
//                                    radius: 20
//                                    Layout.rightMargin: 15
//                                }
//                            }


//                            Text {
//                                Layout.fillWidth: true
//                                topPadding: 0
//                                leftPadding: 10
//                                bottomPadding: 0
//                                padding: 10
//                                text: "Status: " + status
//                                // anchors.fill: parent
//                                // anchors.centerIn: parent
//                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
//                                color: "#C7C9C7"
//                                font.pixelSize: 20
//                            }

//                            Text {
//                                Layout.fillWidth: true
//                                topPadding: 0
//                                leftPadding: 10
//                                bottomPadding: 0
//                                padding: 10
//                                text: "IP: " + ip
//                                // anchors.fill: parent
//                                // anchors.centerIn: parent
//                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
//                                color: "#C7C9C7"
//                                font.pixelSize: 20
//                            }

//                            Text {
//                                Layout.fillWidth: true
//                                topPadding: 0
//                                leftPadding: 10
//                                bottomPadding: 10
//                                padding: 10
//                                text: "Ping: " + ping
//                                // anchors.fill: parent
//                                // anchors.centerIn: parent
//                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
//                                color: "#C7C9C7"
//                                font.pixelSize: 20
//                            }
//                        }
//                    }
//                }
//            }
        }
    }
}
