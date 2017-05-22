/**
 * created by chenxj
 */

$(function(){
	$('#validationModal').modal('show');
});

//验证用户
$("#validateUser").click(function(){
	var loginPassword = $("#loginPassword").val();
	if($.isEmptyObject(loginPassword)){
		swal("请输入登陆密码！");
		return;
	}
	$.ajax({
	        type:"POST",
	        url:urlRootContext()+"/validate_user",
	        data:"password="+loginPassword,
	        async:false,
	        dataType:"json",
	        success: function(response){
	        	if(response.success){
	        		$('#validationModal').modal('hide');
	        	}else{
	        		swal(response.message);
	        	}
	        },error: function(e){
  	           console.error("查询失败:" + e);
 	        }
	});
});
	
/*
 * 表单验证
 */
setDefaultValidator(modifyPassword);

function modifyPassword() {
	var e = "<i class='fa fa-times-circle'></i> ";
	$("#passwordForm").validate({
		rules : {
			password : {
				required : !0,
				minlength : 6,
				maxlength : 20
			},
			confirmPassword : {
				required : !0,
				minlength : 6,
				maxlength : 20,
				equalTo : "#password"
			}
		},
		messages : {
			password : {
				required : e + "请输入您的密码！",
				minlength : e + "密码必须6个字符以上！",
				maxlength : e + "密码必须20个字符以下！"
			},
			confirmPassword : {
				required : e + "请输入您的确认密码！",
				minlength : e + "密码必须6个字符以上！",
				maxlength : e + "密码必须20个字符以下！",
				equalTo : e + "两次输入的密码不一致"
			}
		},
		submitHandler: function (form){
			$.ajax({
				type:"post",
				url:urlRootContext()+"/modify_owned_password",
				data:$(form).serialize(),
				dataType:"json",
				success:function(data){
					if(data.success){
						swal({
							title : data.message,
							type : "success",
							confirmButtonColor : "#AEDEF4",
							confirmButtonText : "确定",
							closeOnConfirm : true
						}, function() {
							window.location.href = urlRootContext()+"/logout";
						});
					}else{
						swal(data.message);
					}
				},
				error:function (XMLHttpRequest, textStatus, errorThrown) {
					// 通常 textStatus 和 errorThrown 之中
					// 只有一个会包含信息
					this; // 调用本次AJAX请求时传递的options参数
					alert(XMLHttpRequest+"\n"+textStatus+"\n"+errorThrown);
				}
			});
        }  
	});
}
