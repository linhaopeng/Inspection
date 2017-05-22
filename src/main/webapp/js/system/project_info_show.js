/**
 * created by chenxj
 */

var type;
var projectId;

/*table data start*/
var PAGESIZE = 8;
var currentPage = 1;
var totalPage = 0;
var numberOfPages = 5;
var projectIdModify;
var options = {  
			containerClass:"pagination",
			currentPage: currentPage,  //当前页数
			totalPages: totalPage,  //总页数
		    size:"normal",  
		    alignment:"center",  
		    numberOfPages: numberOfPages,
		    itemTexts: function (type, page, current) {  
		        switch (type) {  
		            case "first":  
		                return "第一页";  
		            case "prev":  
		                return "前一页";  
		            case "next":  
		                return "后一页";  
		            case "last":  
		                return "最后页";  
		            case "page":  
		                return  page;  
		        }                 
		    },
			onPageChanged: function (event, oldPage, newPage) {  
				
				currentPage = newPage;
		    	buildTable('',newPage,PAGESIZE);//默认每页最多6条
		    	
			},  
		    onPageClicked: function (e, originalEvent, type, page) {  
		    	
		    }  
		} 	




//生成表格
function buildTable(reqData,pageNumber,pageSize,id) {
	
	 var url = urlRootContext()+"/get_project_info_show"; //请求的网址
     $(function () {
     	  $.ajax({
     	        type:"POST",
     	        url:url,
     	        data:{
     	        	'pageNumber':pageNumber,'pageSize':pageSize,
     	        	"typeId":$("#p_typeId option:selected").val(),"name":$("#name").val(),
     				"no":$("#no").val(),"investor":$("#investor").val(),
     				"select_a":$("#select_a option:selected").val(),"select_b":$("#select_b option:selected").val(),
     				"s_value":$("#s_value").val()
     	        },
     	        dataType:"json",
     	        success: function(response){
     	            if(response.success) {
     	            	totalPage = response.data.pages;
     	            	options.totalPages=(totalPage==0?1:totalPage);
     	    			options.currentPage=pageNumber;
						 $('#bottomTab').bootstrapPaginator(options); //重新设置总页面数目
						 var dataList = response.data.dataList;
						 $("#tableBody").empty();//清空表格内容
						 if (dataList.length > 0 ) {
						     $(dataList).each(function(){//重新生成
						    	 
						         $("#tableBody").append('<tr id="'+ this.projectId +'">'+
						            		'<td style="width: 100px;">' + this.name + '</td>'+
						            		'<td style="width: 100px;">' + this.investor + '</td>'+
						            		'<td style="width: 100px;">' + trim_num(this.investment) + '</td>'+
						            		'<td style="width: 100px;">' + trim_num(this.floorArea)  + '</td>'+
						            		'<td style="width: 100px;">' + trim_num(this.assets)  + '</td>'+
						            		'<td style="width: 100px;">' + trim_num(this.acreAssets)  + '</td>'+
						            		'<td style="width: 100px;">' + trim_num(this.annualProductValue)  + '</td>'+
						            		'<td style="width: 100px;">' + trim_num(this.acreProductValue)  + '</td>'+
						            		'<td style="width: 100px;">' + trim_num(this.annualRevenue)  + '</td>'+
						            		'<td style="width: 100px;">' + trim_num(this.acreRevenue)  + '</td>'+
						            		'<td style="width: 100px;">' + trim_num(this.employees)  + '</td>'+
											'</tr>');
						         $("#"+this.projectId).data("userDatas",this);
						     	 });  
						     	$(".i-checks").iCheck({
									checkboxClass : "icheckbox_square-green",
								});
						     
						    } else {             	            	
						     	$("#tableBody").append('<tr><th colspan ="7"><center>查询无数据</center></th></tr>');
						    }
					}else{
						 swal(response.message);
					}
				},
				error: function(e){
     	           console.error("查询失败:" + e);
     	        }
     	    });
       });
}

//渲染完就执行
$(function() {
	
	buildTable("",1,PAGESIZE);//默认空白查全部
});
//查询
$("#getQuery").live('click',function(){
	buildTable('',currentPage,PAGESIZE);//默认每页最多6条
});
//清空
$("#dele_i").live('click',function(){
	$(this).parent().find("input").val('');
});
