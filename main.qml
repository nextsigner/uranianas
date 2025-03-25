import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Window 2.0

import NodeIOQml 1.1

ApplicationWindow{
    id: app
    visible: true
    visibility: 'Maximized'
    color: 'black'
    title: 'Uranianas'

    property int fs: Screen.width*0.03

    property var aCartas: []
    property var aCartasMostradas: []

    NodeIOQml{
        id: niosc
        user: 'nioq'
        host: '192.168.1.50'
        port: 8000
        onDataReceibed:{
            //console.log('DataReceibed: '+data)
            let j=JSON.parse(data)
            console.log('DataReceibed: '+data)
            l.text+=data+'\n'

        }



    }

    Item{
        id: xApp
        anchors.fill: parent
        Flickable{
            id: flk
            anchors.fill: parent
            contentWidth: parent.width
            contentHeight: l.contentHeight+100
            Text{
                id: l
                width: parent.width
                font.pixelSize: 30
                color: 'white'
                wrapMode: Text.WordWrap
                onTextChanged: {
                    flk.contentY=l.contentHeight-flk.height
                }
            }
        }
    }
    Component.onCompleted: {
        app.requestActivate()
        // let fd=unik.getFile('./m1.txt')
        //app.aCartas=fd.split('\n')
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
