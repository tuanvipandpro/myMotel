/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function download(mode) {
    let request = new XMLHttpRequest();
    let url = "download-" + mode.toString();
    request.open("GET", url);
    request.send();
    // request.send(body) // POST thì ném data vào đây (body)
}

