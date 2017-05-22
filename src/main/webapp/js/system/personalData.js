
//img_show
$("#img_show2").live('click',function(){
	//$("#head_img2").click();
});
$("#head_img2").change(function(){

	$.ajaxFileUpload({
		secureuri: false, //一般设置为false
		fileElementId: ['head_img2'], // 上传文件的id、name属性名
		type : "post",
		url : urlRootContext() + "/save_user_headImg",
		data : {},
		dataType : "json",
		success : function(data) {
			if(data.success){
				$("#img_show2").empty();
				var str='<img alt="80x80" src="'+urlRootContext()+data.data.headImg+'?'+Math.random()+'" class="img-responsive">';
				$("#img_show2").append(str);
				location.reload();
			}else{
				alert(data.message);
			}
		},
		error:function(){}
	});
});