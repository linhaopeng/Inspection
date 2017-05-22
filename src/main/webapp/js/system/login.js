/**
 * created by chenxj
 */


/*
 * 登录表单验证
 */
$.validator.setDefaults({
	highlight : function(e) {
		$(e).closest(".form-group").removeClass("has-success").addClass(
				"has-error")
	},
	success : function(e) {
		e.closest(".form-group").removeClass("has-error").addClass(
				"has-success")
	},
	errorElement : "span",
	errorPlacement : function(e, r) {
		e.appendTo(r.is(":radio") || r.is(":checkbox") ? r.parent().parent()
				.parent() : r.parent())
	},
	errorClass : "help-block m-b-none",
	validClass : "m-b-none"
}), $(function() {
	var e = "<i class='fa fa-times-circle'></i> ";
	$("#loginForm").validate({
		rules : {
			username : {
				required : !0,
				minlength : 2,
				maxlength : 20
			},
			password : {
				required : !0,
				minlength : 6,
				maxlength : 20
			},
			code : {
				required : !0,
				minlength : 4
			}
		},
		messages : {
			username : {
				required : e + "Please enter username!",
				minlength : e + "Username must be more than 2 characters!",//用户名必须2个字符以上！
				maxlength : e + "Username must be 20 characters below!" //用户名必须20个字符以下！
			},
			password : {
				required : e + "Please enter password!",
				minlength : e + "Password must be more than 6 characters!", //密码必须6个字符以上！
				maxlength : e + "password must be 20 characters below!" //密码必须20个字符以下！
			},
			code : {
				required : e + "Please enter verification code!",
				minlength : e + "Please enter the corresponding verification code!" // 请输入对应的验证码
			}
		},
		submitHandler: function (form){
            
            $("#login").html('<i class="fa fa-spinner fa-spin"></i>Log in...');
            $("#login").attr("disabled",true);
            $.ajax({
    			type:"post",
    			url:urlRootContext()+"/login",
    			data:$(form).serialize(),
    			dataType:"json",
    			success:function(data){
//    				swal(JSON.stringify(data));
    				$("#login").html('Login');
    	            $("#login").attr("disabled",false);
    				if(data.success){
    					window.location="index";
//    					window.location="project_info_management";
    				}else{
    					switch (data.message) {
						case "code_error":
							swal("code error！");
							$(".form-code-img").trigger("click");
							$("#code").val("");
							$("#code").focus();
							break;
						case "login_error":
							swal("Incorrect username or password!"); // 用户名错误
							$(".form-code-img").trigger("click");
							$("#code").val("");
							break;
						case "username_error":
							swal("Incorrect username or password!"); // 没有该系统用户！
							$(".form-code-img").trigger("click");
							$("#code").val("");
							break;
						case "password_error":
							swal("Incorrect username or password!"); // 密码错误
							$(".form-code-img").trigger("click");
							$("#code").val("");
							$("#password").focus();
							break;
						}
    				}
    			},
    			error:function (XMLHttpRequest, textStatus, errorThrown) {
    				// 通常 textStatus 和 errorThrown 之中
    				// 只有一个会包含信息
    				this; // 调用本次AJAX请求时传递的options参数
    				swal(XMLHttpRequest+"\n"+textStatus+"\n"+errorThrown+"错误");
    			}
    		});
        }  
	});
});
function getNewDialogHeight(oldHeight) {
	var newHeight = oldHeight;
	var ua = navigator.userAgent;
	if(ua.lastIndexOf("MSIE 7.0") != -1) {  
		if(ua.lastIndexOf("Windows NT 5.1") != -1) {
			newHeight = oldHeight-31;
		} else if(ua.lastIndexOf("Windows NT 5.0") != -1) {
			newHeight = oldHeight-84;
		}
	}
	return newHeight;
};

