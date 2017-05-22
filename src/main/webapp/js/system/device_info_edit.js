/**
 * created by chenxj
 */

var ownedCompanyId;
var installedCompanyId;
var type = $("#type").val();

$(function(){
	ownedCompanyId = $("#ownedCompanyId").val();
	installedCompanyId = $("#installedCompanyId").val();
	//初始化值
	if(type == 2){
		$("#deviceType").val($("#deviceTypeValue").val());
		$("#onlineStatus").val($("#onlineStatusValue").val());
	}
});

$("#cancel").click(function(){
	window.location.href=urlRootContext()+"/device_management.do";
});

/*
 * 模态框事件
 */
$('#ownedCompanyModal').on('show.bs.modal', function () {
	selectOwnedCompany();
});

$('#installedCompanyModal').on('show.bs.modal', function () {
	selectInstalledCompany();
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
	$("#deviceForm").validate({
		rules : {
			deviceId : {
				required : !0
			},
			deviceName : {
				required : !0,
				minlength : 1,
				maxlength : 20
			},
			deviceMac : {
				required : !0
			},
			installedPosition : {
				required : !0
			},
			installedCompany : {
				required : !0
			},
			ownedCompany : {
				required : !0
			}
			
		},
		messages : {
			deviceId : {
				required : e + "请输入对应的设备ID！"
			},
			deviceName : {
				required : e + "请输入对应的设备名！",
				minlength : e + "设备名必须1个字符以上！",
				maxlength : e + "设备名必须20个字符以下！"
			},
			deviceMac : {
				required : e + "请输入对应的设备MAC！"
			},
			installedPosition : {
				required : e + "请输入对应的安装地址！"
			},
			installedCompany : {
				required : e + "请选择安装设备的公司！"
			},
			ownedCompany : {
				required : e + "请选择设备所属的公司！"
			}
		},
		submitHandler: function (form){
			saveDeviceInfo(form);
        }  
	});
	
});

var saveDeviceInfo = function(form){
	console.log("submit!");
    $.ajax({
		type:"post",
		url:urlRootContext()+"/device_info_save.do?type="+type+"&ownedCompanyId="+ownedCompanyId+"&installedCompanyId="+installedCompanyId,
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
					cancelButtonText : "取消",
					closeOnConfirm : false
				}, function() {
					window.location.href = urlRootContext()+"/device_management.do";
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

$("#queryOwnedCompanies").click(function(e) {
	selectOwnedCompany();
});

$("#queryInstalledCompanies").click(function(e) {
	selectInstalledCompany();
});

function selectOwnedCompany(){
	$.ajax({
		type:"get",
		url:urlRootContext()+"/getCompanies.do?companyName="+$("#selectOwnedCompanyName").val()+"&companyType=4",
		dataType:"json",
		success : function(data) {
			var tempCompanyId;
			$('table tbody').empty();
			$.each(data.data, function(index, item){
	            var row = create_seller_table_row(item);
	            $('#ownedCompanyModal table tbody').append(row);
	        });

			 $('.footable').trigger('footable_redraw'); 
			 //重新初始化
			 $("#ownedCompanyModal .i-checks").iCheck({
					checkboxClass : "icheckbox_square-green",
					radioClass : "iradio_square-green",
				});
			 $('#ownedCompanyModal .radio input').on('ifChecked', function(event) { //ifCreated 事件应该在插件初始化之前绑定 
					if(true == $(this).is(':checked')){
						tempCompanyId = $(this).val();
					}
				});
			 if(!$.isEmptyObject(ownedCompanyId)){//将选中的值设置为check
				 $("#"+ownedCompanyId+" td:nth-child(1)").iCheck("check");
			 }
			 $("#selectedOwnedCompany").click(function(){
					if(!$.isEmptyObject(tempCompanyId)){
						ownedCompanyId = tempCompanyId;
						$("#ownedCompany").val($("#"+ownedCompanyId+" td:nth-child(3)").html());
						$("#selectOwnedCompanyName").val("");//清空查询框
					}
					$(".close-modal").trigger("click");
				});
		}
	});
}

function selectInstalledCompany(){
	$.ajax({
		type:"get",
		url:urlRootContext()+"/getCompanies.do?companyName="+$("#selectInstalledCompanyName").val()+"&companyType=2",
		dataType:"json",
		success : function(data) {
			var tempCompanyId;
			$('table tbody').empty();
			$.each(data.data, function(index, item){
	            var row = create_seller_table_row(item);
	            $('#installedCompanyModal table tbody').append(row);
	        });

			 $('.footable').trigger('footable_redraw'); 
			 //重新初始化
			 $("#installedCompanyModal .i-checks").iCheck({
					checkboxClass : "icheckbox_square-green",
					radioClass : "iradio_square-green",
				});
			 $('#installedCompanyModal .radio input').on('ifChecked', function(event) { //ifCreated 事件应该在插件初始化之前绑定 
					if(true == $(this).is(':checked')){
						tempCompanyId = $(this).val();
					}
				});
			 if(!$.isEmptyObject(installedCompanyId)){//将选中的值设置为check
				 $("#"+installedCompanyId+" td:nth-child(1)").iCheck("check");
			 }
			 $("#selectedInstalledCompany").click(function(){
					if(!$.isEmptyObject(tempCompanyId)){
						installedCompanyId = tempCompanyId;
						$("#installedCompany").val($("#"+installedCompanyId+" td:nth-child(3)").html());
						$("#selectInstalledCompanyName").val("");//清空查询框
					}
					$(".close-modal").trigger("click");
				});
		}
	});
}