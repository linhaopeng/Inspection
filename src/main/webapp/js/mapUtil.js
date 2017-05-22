/**
 * created by chenxj
 */

/*删除map数据*/
function getObjData(obj,id) {
    for (var i = 0; i < obj.length; i++) {
        var cur_obj = obj[i];
        if (cur_obj.id == id) {
        	return cur_obj.name;
        }
    }
}

/*删除map数据*/
function deleteObjData(obj,id) {
    for (var i = 0; i < obj.length; i++) {
        var cur_obj = obj[i];
        if (cur_obj.id == id) {
        	obj.splice(i, 1);
        }
    }
}