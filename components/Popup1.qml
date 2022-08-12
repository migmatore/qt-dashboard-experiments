import QtQuick 2.12
import QtQuick.Window 2.12
import QtCharts 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Rectangle { // white background
    id: root

    radius: 15
    color: "#191919"
   
// public
    property string  text:    'text'
    property variant buttons: []//'0', '1']
   
    signal clicked(int index, string current);  //onClicked: print('onClicked', index)
   
// private
    width: 500;  height: 500 // default size
   
    MouseArea{anchors.fill: parent} // don't allow touches to pass to MouseAreas underneath
   
    Text { // text
        topPadding: 20
        text: root.text
        anchors { verticalCenterOffset: -0.1 * root.height}
        font.pixelSize: 0.1 * root.height
        width: 0.9 * parent.width
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        color: "#C7C9C7"
    }
    
    Box {
        id: combo
        width: 150
        model: [ "online", "offline" ]
        fillColor: "#202120"
        borderColor: "#202120"
        anchors.centerIn: parent
    }

    Row { // buttons
        id: row
       
        anchors{bottom: parent.bottom;  horizontalCenter: parent.horizontalCenter;  bottomMargin: 0.1 * root.height}
        spacing: 0.03 * root.width
       
        Repeater {
            id: repeater
           
            model: buttons
           
            delegate: Button {
                width: Math.min(0.5 * root.width, (0.9 * root.width - (repeater.count - 1) * row.spacing) / repeater.count)
                height: 0.2 * root.height
                text:  modelData
               
                onClicked: root.clicked(index, combo.currentText)
            }
        }
    }
}