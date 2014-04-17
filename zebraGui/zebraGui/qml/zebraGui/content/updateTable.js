WorkerScript.onMessage = function(message) {
    if (message.listModel) {
        if (message.nPoints < message.listModel.count) {
            message.listModel.remove(message.nPoints,
                                     message.listModel.count - message.nPoints)
        }

        for (var i=0; i<message.nPoints; i++) {
            message.listModel.set(i, {"enc1": message.enc1List[i],
                                      "enc2": message.enc2List[i],
                                      "enc3": message.enc3List[i],
                                      "enc4": message.enc4List[i],
                                      "sys1": message.sys1List[i],
                                      "sys2": message.sys2List[i],
                                      "div1": message.div1List[i],
                                      "div2": message.div2List[i],
                                      "div3": message.div3List[i],
                                      "div4": message.div4List[i]})
        }
        message.listModel.sync()
    }
}
