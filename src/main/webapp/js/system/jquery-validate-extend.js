$(document).ready(function(){
	$.validator.addMethod("regex",function(value,element,params){
		if(!params){return true;}
		if(!value){return false;}
		return params.test(value);
	});
});