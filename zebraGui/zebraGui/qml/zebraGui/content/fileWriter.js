WorkerScript.onMessage = function(message) {
    var output = "ENC1,ENC2,ENC3,ENC4,SYS1,SYS2,DIV1,DIV2,DIV3,DIV4\n"
    var line
    for (var i=0; i<message.data.count; i++) {
        line = message.data.get(i)
        output += String(line.enc1) + "," + String(line.enc2)  + "," +
                String(line.enc3)  + "," + String(line.enc4) + "," +
                String(line.sys1) + "," + String(line.sys2) + "," +                
                String(line.div1) + "," + String(line.div2) + "," +
                String(line.div3) + "," + String(line.div4) + "\n"
    }
    WorkerScript.sendMessage({newCSV: output})
}
