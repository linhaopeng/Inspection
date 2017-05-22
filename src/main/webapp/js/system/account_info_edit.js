/**
 * created by chenxj
 */
var companyId;
var type = $("#type").val();

$(function(){
	companyId = $("#companyId").val();
	
	if(type == 2){
		$("#role").val($("#roleId").val());
		$("#role").find("option[value='"+$("#roleId").val()+"']").attr("selected",true);
	}
	
	$('.radio input').on('ifChecked', function(event) { //ifCreated 事件应该在插件初始化之前绑定 
		if(true == $(this).is(':checked')){
			companyId = $(this).val();
		}
	});
	
});

$("#selectedCompany").click(function(){
	if(!$.isEmptyObject(companyId)){
		$("#account").val($("#"+companyId+" td:nth-child(2)").html());
		$("#companyName").val($("#"+companyId+" td:nth-child(3)").html());
	}
	$("#close").trigger("click");
});

$("#cancel").click(function(){
	window.location.href=urlRootContext()+"/account_info.do";
});

/*
 * 模态框事件
 */
$('#companyModal').on('show.bs.modal', function () {
//	 alert("modal");
});



/*
 * 表单验证
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
	$("#accountForm").validate({
		rules : {
			companyName : {
				required : !0
			},
			username : {
				required : !0,
				minlength : 1,
				maxlength : 20
			},
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
			},
			role : {
				required : !0,
			}
		},
		messages : {
			companyName : {
				required : e + "请选择对应的企业！",
			},
			username : {
				required : e + "请输入您的用户名！",
				minlength : e + "用户名必须1个字符以上！",
				maxlength : e + "用户名必须20个字符以下！"
			},
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
			},
			role : {
				required : e + "请选择您的角色！",
			}
		},
		submitHandler: function (form){
			saveAccountInfo(form);
        }  
	});
	
});

var saveAccountInfo = function(form){
	console.log("submit!");
    $.ajax({
		type:"post",
		url:urlRootContext()+"/account_info_save.do?type="+type+"&companyId="+companyId+"&accountId="+$("#accountId").val(),
		data:$(form).serialize(),
		dataType:"json",
		success:function(data){
			if(data.success){
				swal({
					title : data.message,
					type : "warning",
					showCancelButton : true,
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "确定",
					closeOnConfirm : false
				}, function() {
					window.location.href = urlRootContext()+"/account_info.do";
				});
			}else{
				swal(data.message);
			}
		},
		error:function (XMLHttpRequest, textStatus, errorThrown) {
			// 通常 textStatus 和 errorThrown 之中
			// 只有一个会包含信息
			this; // 调用本次AJAX请求时传递的options参数
			console.warn(XMLHttpRequest+"\n"+textStatus+"\n"+errorThrown);
		}
	});
}

/*选中企业搜索查询*/
function create_seller_table_row (item) {
    var row = $(
    '<tr id="'+item.id+'">'+
		'<td>'+
			'<div class="radio i-checks" >'+
				'<label><input type="radio" value="'+item.id+'" name="companyRadios"> <i></i></label>'+
			'</div>'+
		'</td>'+
		'<td>'+item.companyNum+'</td>'+
		'<td>'+item.companyName+'</td>'+
		'<td>'+item.areaFullName+'</td>'+
	'</tr>');
    return row;
}

$("#selectCompanies").click(function(e) {
	e.preventDefault();
	$.ajax({
		type:"get",
		url:urlRootContext()+"/getCompanies.do?companyName="+$("#selectCompanyName").val(),
		dataType:"json",
		success : function(data) {
//			console.log(JSON.stringify(data.data));
			$('table tbody').empty();
			$.each(data.data, function(index, item){
	            var row = create_seller_table_row(item);
	            $('table tbody').append(row);
	        });

			 $('.footable').trigger('footable_redraw'); 
			 //重新初始化
			 $(".i-checks").iCheck({
					checkboxClass : "icheckbox_square-green",
					radioClass : "iradio_square-green",
				});
			 $('.radio input').on('ifChecked', function(event) { //ifCreated 事件应该在插件初始化之前绑定 
					if(true == $(this).is(':checked')){
						companyId = $(this).val();
					}
				});
			 $("#selectedCompany").click(function(){
					if(!$.isEmptyObject(companyId)){
						$("#account").val($("#"+companyId+" td:nth-child(2)").html());
						$("#companyName").val($("#"+companyId+" td:nth-child(3)").html());
					}
					$("#close").trigger("click");
				});
		}
	});
});