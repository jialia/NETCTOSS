package com.tarena.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.tarena.entity.Admin;

/**
 * 校验用户是否登陆
 * 
 * 	需要在访问Controller业务方法前校验，
 * 	若没有登录则重定向到登录页。
 * 
 * @author Jsong
 */
public class CheckLoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object obj, Exception e)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj, ModelAndView view) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		// 判断用户是否登陆
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			response.sendRedirect(request.getContextPath() + "/login/toLogin.do");
			return false;
		} else {
			return true;
		}
	}

}
