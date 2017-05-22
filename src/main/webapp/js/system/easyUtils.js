/**
 * 
 */
var easyUtils = {
	trimValue:function(selector){
		return $.trim($(selector).val());
	},
	/**
	 * 数组是否包含元素
	 * @param array
	 * @param obj
	 * @returns {Boolean}
	 */
	contains:function(array,obj){
		var flag = false;
		for(var i=0;i<array.length;i++){
			if(array[i] == obj) {
				flag = true;
				break;
			}
		}
		return flag;
	},
	/**
	 * 四舍五入，
	 * @param number 要四舍误入的数字
	 * @param count 保留小数点的位数，不传入count那么就是默认的四舍五入
	 * @returns {Number}
	 */
	round:function(number,count){
		if(!count){return Math.round(number);}
		var power = Math.pow(10,count);
		console.log(power);
		number = Math.round(number*power)/power;
		return number;
	},
	
	/**
	 * 发送ajax请求，可填参数依然和普通的ajax请求一样
	 * @param options
	 */
	ajax:function(options){
		var _url = options.url;
		if(!_url){console.log("easyUtils.ajax的url不能为空！");return;}
		var _data = options.data||"";
		var _type = options.type || "POST";
		var _dataType = options.dataType || "JSON";
		var _timeout = options.timeout || 40000;
		var _cache = options.cache || false;
		var _async = options.async;
		var _success = options.success;
		var _error = options.error || function(XMLHttpRequest, textStatus, errorThrown){
			console.log(XMLHttpRequest);
			console.log(errorThrown);
			alert("网络错误，访问失败！");
		}
		if(!_async && _async !== false){_async = true;}//默认为true
		$.ajax({
			url:_url,
			type:_type,
			data:_data,
			dataType:_dataType,
			timeout:_timeout,
			cache:_cache,
			async:_async,
			success:_success,
			error:_error
		});
	},
	/**
	 * 格式化日期,不扩展Date对象
	 * @param dateObj
	 * @param format
	 * @returns {String}
	 */
	formatDate:function(dateObj,format){
		if(!format){format = "yyyy-MM-dd hh:mm:ss";}//如果没有填写，那么默认为全格式
		/* 
		 * 使用例子:
		 * dateObj要格式化的日期，是一个js对象
		 * format="yyyy-MM-dd hh:mm:ss"; 
		 */  
		var o = {  
			"M+" : dateObj.getMonth() + 1, // month  
			"d+" : dateObj.getDate(), // day  
			"h+" : dateObj.getHours(), // hour  
			"m+" : dateObj.getMinutes(), // minute  
			"s+" : dateObj.getSeconds(), // second  
			"q+" : Math.floor((dateObj.getMonth() + 3) / 3), // quarter  
			"S" : dateObj.getMilliseconds()  
			// millisecond  
		}  

		if (/(y+)/.test(format)) {  
			format = format.replace(RegExp.$1, (dateObj.getFullYear() + "").substr(4  
							- RegExp.$1.length));  
		}  

		for (var k in o) {  
			if (new RegExp("(" + k + ")").test(format)) {  
				format = format.replace(RegExp.$1, RegExp.$1.length == 1  
								? o[k]  
								: ("00" + o[k]).substr(("" + o[k]).length));  
			}  
		}  
		return format;  
	}
}