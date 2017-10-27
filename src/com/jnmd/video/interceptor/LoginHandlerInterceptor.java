package com.jnmd.video.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginHandlerInterceptor implements HandlerInterceptor{

	//执行时机：controller执行之后，并且视图返回后
	//一般用于记录controller异常信息或者记录操作日志
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		System.out.println("afterCompletion执行");
		
	}

	//执行时机：controller执行完毕，但是视图还未返回
	//一般在此方法中可以返回当前用户的数据模型（Model）
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		System.out.println("postHandle执行");
		
	}
	
	
    //一般在controller方法执行之前
	//一般用于登录校验，权限拦截
	//返回true:表示放行，继续执行
	//返回false:表示不放行
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		
		System.out.println("进入preHandle");
		HttpSession session = request.getSession();
		Object username = session.getAttribute("username");
		if(null!=username){
			return true;
		}else{
			response.sendRedirect("/admin/showLogin");
			return false;
		}
		
	}

}
