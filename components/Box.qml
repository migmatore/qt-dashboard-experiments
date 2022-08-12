import QtQuick 2.7
import QtQuick.Controls 2.5
 
ComboBox {
    id:control
    property var fillColor: Qt.rgba(84/254, 144/254, 214/254,0.3)
    property var borderColor: Qt.rgba(80/254, 135/254, 200/254,0.8)
    property var selectFillColor: "#68c169"//Qt.rgba(104/254, 193/254, 105/254,0.3)
    width: 120
    height: 40
    font.pixelSize: 18
    font.family: "SimHei"
 
    /*Displayed text*/
    contentItem: Text {
        leftPadding: 10
        text: control.displayText
        font: control.font
        color: "#C7C9C7"
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
 
         /*Display background*/
    background: Rectangle {
        implicitWidth: control.width
        implicitHeight: control.height
        color: fillColor
        border.color: borderColor
        border.width: 1
        radius: 10
 
    }
 
         /*Drop down icon*/
    indicator: Canvas {
        id: canvas
        x: control.width - 20
        y: (control.height)/2-2
        width: 12
        height: 7
        contextType: "2d"
 
        onPaint: {
//            context.reset();
 
                         context.lineWidth = 2; //brush width
            context.strokeStyle="#C7C9C7";
            context.moveTo(0, 0);
            context.lineTo(width/2, height);
            context.lineTo(width, 0);
            context.stroke();
//            context.closePath();
//            context.fillStyle = "white";
//            context.fill();
        }
    }
 
 
         /* drop-down box options*/
    delegate: ItemDelegate {
        width: control.width
        contentItem: Rectangle
        {
            anchors.fill:parent
            color:hovered ? selectFillColor : fillColor
            height:40
            Text {
                anchors.centerIn: parent
                text: modelData
                color: "#C7C9C7"
                font: control.font
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
            }
        }
 
    }
 
         /*The background of the pop-up box after clicking*/
    popup: Popup {
        y: control.height + 5
        width: control.width
        implicitHeight: listview.contentHeight
        padding: 1
        modal: true
 
        contentItem: ListView {
            id: listview
            clip: true
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex
 
            ScrollIndicator.vertical: ScrollIndicator { }
        }
 
        background: Rectangle {
            border.color: borderColor
            color: fillColor
            radius: 10
 
        }
    }
}
 
 