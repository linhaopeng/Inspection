/**
 * created by chenxj
 */

var app = angular.module('myApp', []);
app.controller('projectsCtrl', function($scope, $http) {
	$(".loading").css("display","block");
	getProjects($scope, $http);
	$scope.searchProjects=function(){
		$(".loading").css("display","block");
		var projectName = $("#projectName").val();
		$http.get("projects/searchProjects.do?projectName="+projectName)
				.success(function(response) {
					console.info(response.data);
					if(response.success){
						$(".loading").css("display","none");
						$scope.projects = response.data;
					}else{
						$(".loading").css("display","none");
						$(".sweet-overlay").css("display","block");
						swal({
							title : "消息提示",
							text : response.message,
							confirmButtonColor : "#DD6B55",
							confirmButtonText : "刷新"
						}, function() {
							swal("刷新成功！", "正在加载中...", "success");
							$(".sweet-overlay").css("display","none");
						})
					}
				});
	}
	
	$scope.refreshProjects=function(){
		simpleLoad($("#loading-example-btn"), true);
		getProjects($scope, $http);
	}
});

function getProjects($scope, $http){	
	$http.get("projects/getProjects.do")
	.success(function(response) {
		console.info(response.data);
		simpleLoad($("#loading-example-btn"), false);
		if(response.success){
			$(".loading").css("display","none");
			$scope.projects = response.data;
		}else{
			$(".loading").css("display","none");
			$(".sweet-overlay").css("display","block");
			swal({
				title : "消息提示",
				text : response.message,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "确定"
			}, function() {
				swal("刷新成功！", "正在加载中...", "success");
				$(".sweet-overlay").css("display","none");
			})
		}
	});
}

function simpleLoad(btn, state) {
	if (state) {
		btn.children().addClass("fa-spin");
		btn.contents().last().replaceWith(" Loading")
	} else {
		setTimeout(function() {
			btn.children().removeClass("fa-spin");
			btn.contents().last().replaceWith(" Refresh")
		}, 2000)
	}
}

function editProjects(obj){
	var editId=$(".edit"+obj.attr("id"));
	var display=editId.css("display");
	display = display == "none"? "table-row":"none";
	editId.css("display",display);
}

function modifyProject(obj){
	var id=obj.attr("id").substring(6);
	console.info(id);
	var status=$("#status"+id).val();
	var title=$("#title"+id).val();
	var description=$("#description"+id).val();
	$.ajax({
		url : 'projects/modifyProject.do',// 跳转到 action  
		type : 'post',
		data : {
			id : id,
			status : status,
			name : title,
			description : description
		},
		cache : false,
		dataType : 'json',
		success : function(response) {
			var result;
			if (response.success) {
				result="修改成功！";
			} else {
				result="修改失败！";
			}
			swal({
				title : result,
				text : response.message,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "确定"
			});
		},
		error : function() {
			alert("异常！");
		}
	});
	
}
