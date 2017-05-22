/**
 * ceated by chenxj
 */

var currentRQ = $.cookie("currentRQ");
var rqId;//如果后面这个

$(function(){
	$("#ownedAreaValue").click(function (e) {
		SelCity(this,e);
	});
	$("#ownedArea").click(function (e) {
		SelCity(this,e);
	});
	$.ajax({
		type:"get",
		url:urlRootContext()+"/get_residential_quarter_info",
		data:"rqId="+currentRQ,
		dataType:"json",
		success:function(data){
			var residentialQuarter = data.data[0];
			$(".modifyRqInfo").data("rqInfo",residentialQuarter);
			rqId = residentialQuarter.id;
			setRqList(residentialQuarter);
		},
		error:function (XMLHttpRequest, textStatus, errorThrown) {
			// 通常 textStatus 和 errorThrown 之中
			// 只有一个会包含信息
			this; // 调用本次AJAX请求时传递的options参数
			console.error(XMLHttpRequest+"\n"+textStatus+"\n"+errorThrown);
		}
	});
	
	
	//修改小区信息
	$(".modifyRqInfo").click(function(){
		var rqInfo = $(".modifyRqInfo").data("rqInfo");
		$("#rqName").val(rqInfo.rqName);
		$("#companyName").val(rqInfo.companyName);
		$("#contact").val(rqInfo.contact);
		$("#ownedArea").val(rqInfo.ownedArea);
		$("#rqAddress").val(rqInfo.rqAddress);
		$("#rqDescription").val(rqInfo.rqDescription);
		$("#rqInfoEditModal").modal("show");
		$("#rqInfoEditModal").scroll(function(){
			console.info($(this).position().top);//TODO 
		});
	});
});

/*
 * 表单验证
 */
setDefaultValidator(rqInfoFormValidator);

function rqInfoFormValidator(){
	var e = "<i class='fa fa-times-circle'></i> ";
	$("#rqInfoForm").validate({
		rules : {
			rqName : {
				required : !0,
				minlength : 1,
				maxlength : 20
			},
			companyName : {
				required : !0,
				minlength : 1,
				maxlength : 20
			},
			ownedArea : {
				required : !0
			},
			contact : {
				 isPhone : !0
			},
			rqAddress : {
				required : !0,
				minlength : 1,
				maxlength : 50
			},
		},
		messages : {
			rqName : {
				required : e + "请输入小区名称！",
				minlength : e + "小区名称必须1个字符以上！",
				maxlength : e + "小区名称名必须20个字符以下！"
			},
			companyName : {
				required : e + "请输入用户名！",
				minlength : e + "单位名称必须1个字符以上！",
				maxlength : e + "单位名称名必须20个字符以下！"
			},
			ownedArea : {
				required : e + "请选择对应的行政区域！"
			},
			contact : {
				isPhone : e + "请输入有效的联系电话！"
			},
			rqAddress : {
				required : e + "请输入小区地址！",
				minlength : e + "小区地址必须1个字符以上！",
				maxlength : e + "小区地址名必须20个字符以下！"
			},
		},
		submitHandler: function (form){
			saveRqInfo(form);
        }  
	});
}

var saveRqInfo = function(form){
	console.log("submit!");
    $.ajax({
		type:"post",
		url:urlRootContext()+"/save_residential_quarter_info?type=2&rqId="+rqId,
		traditional:true,
	    data:$(form).serialize(),
		dataType:"json",
		success:function(data){
			if(data.success){
				//改变列表显示的值
				var rqInfo = data.data.residentialQuarter;
				$(".modifyRqInfo").data("rqInfo",rqInfo);
				setRqList(rqInfo);
				//改变当前小区选择框的值
				var rqList;
				var dataList = data.data.managedRQs;
				$(dataList).each(function(){
					rqList += '<option value="'+this.id+'">'+this.rqName+'</option>';
				});
				$(window.parent.document.body).find("#currentRQ").html(rqList)
				$(window.parent.document.body).find("#currentRQ").val(rqId);
				swal({
					title : data.message,
					type : "success",
					confirmButtonColor : "#AEDEF4",
					confirmButtonText : "确定",
					closeOnConfirm : true
				}, function() {
					$("#rqInfoEditModal").modal("hide");
				});
			}else{
				swal(data.message);
			}
		},
		error:function (XMLHttpRequest, textStatus, errorThrown) {
			// 通常 textStatus 和 errorThrown 之中
			// 只有一个会包含信息
			this; // 调用本次AJAX请求时传递的options参数
			console.error(XMLHttpRequest+"\n"+textStatus+"\n"+errorThrown);
		}
	});
}

//设置信息列表值
function setRqList(rfInfo){
	$("#rqNameValue").html(rfInfo.rqName);
	$("#companyNameValue").html(rfInfo.companyName);
	$("#contactValue").html(rfInfo.contact);
	$("#ownedAreaValue").html(rfInfo.ownedArea);
	$("#rqAddressValue").html(rfInfo.rqAddress);
	$("#rqDescriptionValue").html(rfInfo.rqDescription);
}