/**
 * created by chenxj
 */

var id = location.hash.substring(1);
var app = angular.module('myApp', []);
app.controller('projectCtrl', function($scope, $http) {
	$http.get("projects/getProjectDetial.do?id="+id)
			.success(function(response) {
				console.info(response.data);
				if(response.success){
					$scope.project = response.data.project;
					$scope.issues = response.data.issues;
				}else{
					alert(response.message);
					location.href="login.html";
				}
			});
});