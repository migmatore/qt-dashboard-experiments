import QtQuick 2.12
import QtQuick.Window 2.12
import QtCharts 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 1024
    height: 768

    Button {
        text: "add"
        width: 500
        height: 500
        onClicked: {
            repModel.append({title: "aaa"})
        }
    }

    Flow {
        spacing: 10
        width: 400
        Repeater {
            //model: ["root", "item1","subitem1","one more items"]
            model: ListModel {
                id: repModel
                ListElement { title: "title 1" }
                ListElement { title: "title 2" }
                ListElement { title: "title 3" }
                ListElement { title: "title 4" }
                ListElement { title: "title 4" }
                ListElement { title: "title 4" }
            }
            // delegate: Label {
            //     padding: 10
            //     text: title
            //     background: Rectangle {
            //         color: "#DEDEDE"
            //     }
            // }
            delegate: Rectangle {
                width: 100
                height: 100
                radius: 15

                MouseArea {
                    onClicked: {
                        repModel.append({title: "bbb"})
                    }
                    
                }

                Label {
                    padding: 10
                    text: title
                }
            }
        }        
    }

    // ListView {
    //     id: lv
    //     width: 300
    //     height: 300
    //     orientation: ListView.Horizontal
    //     contentX: listController.contentX
    //     // model: ListModel {
    //     //     id: repModel
    //     //             ListElement { title: "title 1" }
    //     //             ListElement { title: "title 1" }
    //     //             ListElement { title: "title 1" }
    //     //         }
    //     model: 1
    //     delegate: Flow {
    //         //spacing: 3
    //         width: 70

    //         // Label {
    //         //         padding: 10
    //         //         text: title
    //         //         background: Rectangle {
    //         //             color: "#DEDEDE"
    //         //         }
    //         //     }

    //         Repeater {
    //             model: ["root", "item1","subitem1","one more items"]
    //             // model: ListModel {
    //             //     id: repModel
    //             //     ListElement { title: "title 1" }
    //             //     ListElement { title: "title 2" }
    //             //     ListElement { title: "title 3" }
    //             //     ListElement { title: "title 4" }
    //             //     ListElement { title: "title 5" }
    //             //     ListElement { title: "title 6" }
    //             // }
    //             //model: lv.model
    //             delegate: Label {
    //                 padding: 10
    //                 text: modelData
    //                 background: Rectangle {
    //                     color: "#DEDEDE"
    //                 }
    //             }
    //         }        
    //     }
    // }
    

    // ListView {
    //     width: 640
    //     height: 480
    //     visible: false

    //     model: ListModel {
    //         ListElement { title: "title 1" }
    //         ListElement { title: "title 2" }
    //         ListElement { title: "title 3" }
    //         ListElement { title: "title 4" }
    //     }

    //     delegate: Row {
    //         width: parent.width
    //         Text {
    //             text: title
    //             width: 100
    //             elide: Text.ElideRight
    //         }
    //         Column {
    //             Repeater {
    //                 model: ListModel {
    //                     ListElement { name: "name 1"; description: "desc 1" }
    //                     ListElement { name: "name 2"; description: "desc 2" }
    //                 }
    //                 delegate: Column {
    //                     // Rectangle {
    //                     //     width: 100
    //                     //     height: 100
    //                     //     border.color: "black"

                            
    //                     // }
    //                     Text { text: "name: " + name + "; desc: " + description }
    //                 }
    //             }
    //         }
    //     }
    // }

    // GridLayout {
    //     id: grid
    //     anchors.fill: parent
    //     anchors.centerIn: parent
    //     width: parent.width
    //     height: parent.height
    //     rows: 1
    //     columns: 4

    //     //columnSpacing: 10
    //     //rowSpacing: 10

    //     anchors.leftMargin: 15 
    //     anchors.rightMargin: 15
    //     anchors.topMargin: 20 
    //     anchors.bottomMargin: 20 

    //     property double colMulti : grid.width / grid.columns
    //     property double rowMulti : grid.height / grid.rows
    //     function prefWidth(item){
    //         return colMulti * item.Layout.columnSpan
    //     }
    //     function prefHeight(item){
    //         return rowMulti * item.Layout.rowSpan
    //     }

    //     Rectangle {
    //         id: c
    //         Layout.columnSpan: 3
    //         Layout.rowSpan: 1
    //         Layout.preferredWidth  : grid.prefWidth(this)
    //         Layout.preferredHeight : grid.prefHeight(this)
    //         radius: 15
    //         border.color: "black"

    //         ChartView {
    //             anchors.centerIn: c
    //             width: c.width
    //             height: c.height
    //             antialiasing: true
    //             // Layout.row: 1
    //             // Layout.column: 2
    //             // Layout.fillHeight: true
    //             // Layout.fillWidth: true
    //             // Layout.columnSpan: 3
    //             // Layout.rowSpan: 1
    //             // Layout.preferredWidth  : grid.prefWidth(this)
    //             // Layout.preferredHeight : grid.prefHeight(this)
            
    //             LineSeries{
    //                 id: lineSeries
    //                 name: "Temperature"
    //                 //useOpenGL: true
    //                 axisX: ValueAxis {
    //                     id: axisX
    //                     min: 0
    //                     max: 60
    //                 }
    //                 axisY: ValueAxis {
    //                     id: axisY
    //                     min: 20
    //                     max: 32
    //                 }
    //             }

    //             Timer {
    //                 interval: 60000
    //                 running: true
    //                 repeat: true
    //                 onTriggered: obj.update(lineSeries)
    //             }
    //         }
    //     }

    //     Rectangle {
    //         id: r

    //         Layout.columnSpan: 1
    //         Layout.rowSpan: 1
    //         Layout.preferredWidth  : grid.prefWidth(this)
    //         Layout.preferredHeight : grid.prefHeight(this)

    //         border.color: "red"
    //         radius: 15
            

    //         Text{ 
    //             anchors.centerIn: r
    //             text:  obj.text
    //             //text: "temperature: 27°C"
    //             font.pixelSize: 20
    //             // Layout.row: 1
    //             // Layout.column: 3
    //             // Layout.fillHeight: true
    //             // Layout.fillWidth: true
    //             // Layout.columnSpan: 1
    //             // Layout.rowSpan: 1
    //             // Layout.preferredWidth  : grid.prefWidth(this)
    //             // Layout.preferredHeight : grid.prefHeight(this)
    //         }

    //     }
    // }
}
