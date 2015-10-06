package com.tarena.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 	判断当前访问模块的拦截器，根据用户访问的URL，提取出当前模块信息，并存入session。
 * 
 * @author Jsong
 */
public class CurrentModuleInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		//获取用户访问URL
		String url = request.getRequestURI().toString();
		//根据用户URL判断访问模块
		int currentModule = 0;
		if (url.contains("role")) {
			currentModule = 1;
		} else if (url.contains("admin")) {
			currentModule = 2;
		} else if (url.contains("cost")) {
			currentModule = 3;
		} else if (url.contains("account")) {
			currentModule = 4;
		}else if (url.contains("service")) {
			currentModule = 5;
		}else if (url.contains("bill")) {
			currentModule = 6;
		}else if (url.contains("report")) {
			currentModule = 7;
		}
		else if (url.contains("UserInfo")) {
			currentModule = -1;
		}else if (url.contains("UserPassword")) {
			currentModule = -2;
		}
		request.getSession().setAttribute("currentModule", currentModule);
		return true;
	}

}
