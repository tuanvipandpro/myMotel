/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function doCheck(oldE, oldW, id) {
    let oldElectric = parseInt(oldE);
    let newElectric = parseInt(document.getElementById('newElectric' + id).value);
    let oldWater = parseInt(oldW);
    let newWater = parseInt(document.getElementById('newWater' + id).value);

    if ((oldElectric < newElectric) && (oldWater < newWater)) {
        alert('Hợp lệ');
    } else {
        alert('Không hợp lệ');
    }
    ;
    return false;
}
