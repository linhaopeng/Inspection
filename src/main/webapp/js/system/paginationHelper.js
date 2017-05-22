/**
 * pageInfo MyBatis分页插件返回的page信息
 * pageHelper一般有仨属性,element、callBack、pageCount
 */
var pagination = function(pageInfo,pageHelper) {
	var element = pageHelper.element;//插入分页的位置
	var callBack = pageHelper.callBack;//点击页码后，回调的函数名
	var pageCount = pageHelper.pageCount;//要展示的页码总数，
	if(!element) {element = $(".pagination");}
	if(!callBack) {callBack = "getPageBean";}
	if(!pageCount) {pageCount = 5};//总计显示5页
	
	var preCount = 2;//当前页前面显示两页
	var endCount = pageCount-preCount-1;//当前页后面显示的页数
	// 分页开始
	var totalPage = parseInt(pageInfo.pages);//总页码数
	var pageNum = parseInt(pageInfo.pageNum);//当前页
	var pageSize = parseInt(pageInfo.pageSize);//页码大小
	var total = parseInt(pageInfo.total);//总记录数
	if(totalPage <=0) {
		totalPage = 1;
	}
	if(pageNum > totalPage) {
		pageNum = totalPage;
	}
	//计算beginPage和endPage
	var begin = pageNum - preCount;
	var end = pageNum +endCount;
	
	if(begin<=0) {
		begin = 1;
		end=begin+pageCount;
	}
	if(end>totalPage) {
		end = totalPage;
		begin = end-pageCount;
		if(begin<=0) {
			begin = 1;
		}
	}
	
	var isFirstPage = pageInfo.isFirstPage;
	var isLastPage = pageInfo.isLastPage;
	element.html("");
	if(!isFirstPage) {//不是第一页
		element.append('<li id="previous_li"><a id="Previous" href="javascript:" onclick ='+ callBack+"("+(pageNum-1)+') aria-label="Previous">&laquo;</a></li>');
	} else {
		element.append('<li id="previous_li"><a id="Previous" href="javascript:" aria-label="Previous">&laquo;</a></li>');
	}
	for(var i = begin;i <= end;i++){
		if(i == pageNum) {
			element.append("<li class='active'><a href='javascript:;' class='pageNum active'>"+ i +"</a></li>");
		} else {
			element.append("<li><a href='javascript:' onclick="+callBack+"("+i+") class='pageNum'>"+ i +"</a></li>");
		}
	}
	if(!isLastPage){//不是最后一页
		element.append('<li><a href="javascript:" onclick ='+ callBack+"("+(pageNum+1)+') id="next" aria-label="Next">&raquo;</a></li>');
	} else {
		element.append('<li><a href="javascript:" id="next" aria-label="Next">&raquo;</a></li>');
	}
	element.append('<li><a>共:'+ end +'页,每页'+ pageSize +'条记录,总计:'+total+'条记录</a></li>');
}