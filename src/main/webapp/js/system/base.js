/**
 * created by chenxj
 */

//var base_path="/AAS";

//获取当前项目的路径
var urlRootContext = function () {
//    var strPath = window.document.location.pathname;
//   // var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
//    var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
//    alert(postPath);
//    return postPath;
	//获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath = window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht = curWwwPath.substring(0, pos);
    //获取带"/"的项目名，如：/uimcardprj
    pathName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    return (localhostPaht + pathName);
};

