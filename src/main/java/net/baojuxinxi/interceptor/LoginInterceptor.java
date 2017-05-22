package net.baojuxinxi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.baojuxinxi.pojo.SystemUsers;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;


public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelAndView) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		SystemUsers user=(SystemUsers) request.getSession().getAttribute("user");
		if(user==null){
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
			/*response.setCharacterEncoding("utf-8");
			response.setContentType("application/json");
			Writer pw = response.getWriter();
			pw.write("{\"success\":false,\"message\":\"请先登录系统\"}");
			pw.flush();
			pw.close();*/
			String realPath = request.getRequestURI();
			if(realPath.contains("/upload")){
				return true;
			}
			if(realPath.contains("/phone/")){
				request.setAttribute("code", "loginout");
//				response.sendRedirect(basePath+"/phone/loginss");
				return false;
			}else{
				response.sendRedirect(basePath+"/login");
				return false;
			}
		}else{
			return true;
		}
	}

}
