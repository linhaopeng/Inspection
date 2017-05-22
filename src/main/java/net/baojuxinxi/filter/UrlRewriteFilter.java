package net.baojuxinxi.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

public class UrlRewriteFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		final HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		String servletPath = httpRequest.getServletPath();
//		HttpSession session = httpRequest.getSession();
		Cookie[] cookies = httpRequest.getCookies();
		if(cookies == null || cookies.length == 0){
			String str = httpResponse.encodeRedirectURL(httpRequest.getRequestURI());
			System.out.println("#####doFilter:"+str);
			
		}else{
			for (Cookie cookie : cookies) {
				if("jsessionid".equalsIgnoreCase(cookie.getName())){
					System.out.println("&&&&&jsessionid:"+cookie.getValue());
				}
			}
		}
		chain.doFilter(httpRequest,httpResponse);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	
}
