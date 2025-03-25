import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Window 2.0

ApplicationWindow{
    id: app
    visible: true
    visibility: 'Maximized'
    color: 'black'
    title: 'Uranianas'

    property int fs: Screen.width*0.03

    property var aCartas: []
    property var aCartasMostradas: []

    Item{
        id: xApp
        anchors.fill: parent
        Rectangle{
            id: xTxt
            width: parent.width-app.fs*2//app.fs*6
            height: parent.height-app.fs*2//app.fs*10
            color: 'black'
            border.width: 2
            border.color: 'white'
            radius: app.fs*0.5
            anchors.centerIn: parent
            visible: !tResize.running
            Behavior on opacity {NumberAnimation{id: na; duration: 500}}
            onVisibleChanged: {
                if(visible){
                    na.duration=2500
                    opacity=1.0
                }else{
                    na.duration=0
                    opacity=0.0
                }
            }
            Text{
                id: txt1
                text:  'Presioná la tecla Enter'
                color: 'white'
                font.pixelSize: app.fs*0.8
                width: parent.width-app.fs
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                anchors.centerIn: parent
            }
            Timer{
                id: tResize
                running: txt1.contentHeight>xTxt.height-app.fs || txt1.contentWidth>xTxt.width-app.fs
                repeat: true
                interval: 50
                onTriggered: {
                    txt1.font.pixelSize-=app.fs*0.1
                }
            }
        }
    }
    Component.onCompleted: {
        app.requestActivate()
        let fd=unik.getFile('./m1.txt')
        app.aCartas=fd.split('\n')
    }
    Shortcut{
        sequence: 'Esc'
        onActivated: {
            app.close()
            //Qt.quit()
        }
    }
    Shortcut{
        sequence: 'Return'
        onActivated: {
            lanzarCarta()
        }
    }
    Shortcut{
        sequence: 'Enter'
        onActivated: {
            lanzarCarta()
        }
    }
    function lanzarCarta(){
        let d = new Date(Date.now())
        let ms = d.getTime()
        let n = aleatorio(0, app.aCartas.length-1)
        txt1.text=app.aCartas[n]
        txt1.font.pixelSize=app.fs*10


    }
    function aleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1)) + min;
    }
}
