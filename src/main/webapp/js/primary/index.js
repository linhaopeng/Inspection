/**
 * created by chenxj
 */

var app = angular.module('myApp', []);
app.controller('userInfoCtrl', function($scope, $http) {
	$http.get("user/getUser.do")
			.success(function(response) {
				console.info(response.data);
				if(response.success){
					$scope.user = response.data;
				}else{
					alert(response.message);
					location.href="login.html";
				}
			});
});