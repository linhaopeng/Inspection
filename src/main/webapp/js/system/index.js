/**
 * created by chenxj
 */

$(function(){
	setCurrentRQCookie()
});

$("#currentRQ").change(function(){
	setCurrentRQCookie();
});

//将当前小区值存入cookie
function setCurrentRQCookie(){
	$.cookie("currentRQ", $("#currentRQ").val(), {expires: 7, path: urlRootContext()});
	$.cookie("currentRQName", $("#currentRQ [value='"+$("#currentRQ").val()+"']").html(), {expires: 7, path: urlRootContext()}); 
	console.info("index:"+$.cookie("currentRQ"));
	console.info("indexName:"+$.cookie("currentRQName"));
}

/*var id = location.hash.substring(1);
var app = angular.module('myApp', []);
app.controller('indexCtrl', function($scope, $http) {
	$http({
			method:"post",
			url:'index.do',
		}).success(function(response){
		if(response.success){
			$scope.menus = response.data.menus;
			$scope.user = response.data.user;
			$scope.role = response.data.role;
			console.info(JSON.stringify(response.data));
		}else{
			swal({
				title : response.message,
				type : "warning",
				confirmButtonText : "确定",
				closeOnConfirm : false
			},function() {
				window.location = "login.do";
			});
		}
    }).error(function(data) {
    	swal({
			title : data.message,
			type : "warning",
			confirmButtonText : "确定",
			closeOnConfirm : false
		},function() {
			window.location = "login.do";
		});
    });
});
*/

//img_show
$("#img_show").live('click',function(){
	
	$("#head_img").click();
});
$("#show_a").live('click',function(){
	
	$("#head_img").click();
});
$("#head_img").change(function(){

	$.ajaxFileUpload({
		secureuri: false, //一般设置为false
		fileElementId: ['head_img'], // 上传文件的id、name属性名
		type : "post",
		url : urlRootContext() + "/save_user_headImg",
		data : {},
		dataType : "json",
		success : function(data) {
			if(data.success){
				$("#img_show").empty();
				var str='<img alt="image" src="'+urlRootContext()+data.data.headImg+'?'+Math.random()+'" class="img-responsive img-circle" alt="Cinque Terre">';
				$("#img_show").append(str);
				location.reload();
			}else{
				alert(data.message);
			}
		},
		error:function(){}
	});
});

$(function(){
	var t=/project_info_management/;
	var u=$(".J_menuItem");
	u.each(function(){
		var h=$(this).attr("href");
		if(t.test(h)){
			$(this).click();
		}
	});
});


//头像裁剪

