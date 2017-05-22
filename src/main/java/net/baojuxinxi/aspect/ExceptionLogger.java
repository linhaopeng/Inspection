package net.baojuxinxi.aspect;

import org.apache.log4j.Logger;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class ExceptionLogger {
	Logger logger=Logger.getLogger(ExceptionLogger.class);
	
	/*@Resource
	private IOperationLogs operationLogsService;
	
	@Resource
	private ISystemLogs systemLogsService;

	*//**
	 * 异常还有操作日志 的aop操作
	 * （排除controller下以get和to开头的方法）
	 * @param p
	 * @return
	 * @throws IOException
	 *//*
	@Around("within(net.baojuxinxi.controller.*) and (!execution(* net.baojuxinxi.controller..*.get*(..))) and (!execution(* net.baojuxinxi.controller..*.to*(..)))")
	public Object exception(ProceedingJoinPoint p) throws IOException{
		Object obj=null;
		ServletRequestAttributes attrs=(ServletRequestAttributes)
				RequestContextHolder.getRequestAttributes();
		HttpServletRequest request=attrs.getRequest();
		HttpSession session=request.getSession();
		String ip = request.getRemoteHost();
		String now=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
		BackgroundUsers user=(BackgroundUsers) session.getAttribute("user");	
		StringBuffer sb=new StringBuffer();
		if(user!=null){
			sb.append("用户[")
				.append(user.getUsername())//TODO 
				 .append("],");
		}
		sb.append("IP[")
		   .append(ip)
		   .append("],在[")
		   .append(now)
		   .append("],");
		
		try {
			obj=p.proceed();
			
			//保存操作日志（1-增，2-删，3-改）
			String logContent = (String) request.getAttribute("logContent");
			Integer operType = (Integer) request.getAttribute("operType");
			OperationLogs operationLog = new OperationLogs();
			operationLog.setLogContent(sb.append(logContent).toString());
			operationLog.setOperType(operType);
			operationLog.setOperPerson(user != null ? user.getUsername():"无用户");
			operationLog.setCreatedTime(new Date());
			operationLog.setLatestUpdateTime(new Date());
			operationLogsService.addOperationLogs(operationLog);
			
		} catch (Throwable e) {
			
			String className=p.getTarget().getClass().getName();
			String methodName=p.getSignature().getName();
			String reqParams = JSONObject.toJSONString(request.getParameterMap());
			
			//保存到数据库
			SystemLogsWithBLOBs systemLog = new SystemLogsWithBLOBs();
			systemLog.setReqIp(ip);
			systemLog.setReqPerson(user.getUsername());
			systemLog.setReqParams(reqParams);
			systemLog.setExceptionMethod(className+methodName);
			systemLog.setMethodDescription("");
			systemLog.setExceptionCode(e.getClass().getName());
			systemLog.setExceptionDetail(ThrowableToStr.getTrace(e));//异常详情
			systemLog.setCreatedTime(new Date());
			systemLog.setLatestUpdateTime(new Date());
			systemLogsService.addSystemLogs(systemLog);
			
			sb.append("执行[")
			   .append(className)
			   .append(".")
			   .append(methodName)
			   .append("]时，发生如下异常：");
			
			logger.error(sb);
			StackTraceElement[] elems = e.getStackTrace();
			for(StackTraceElement elem:elems){
				logger.error("\t"+elem);
			}
			
			Result result=new Result();
			result.setSuccess(false);
			result.setMessage("系统发生错误，请联系管理员");
			
			return result;
		}
		return obj; 
	} */
	
}
