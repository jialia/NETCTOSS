package com.tarena.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.tarena.entity.Module;

/**
 * 权限检查拦截器
 * 		用于检查当前用户是否拥有权限
 * 
 * @author Jsong
 */
public class CheckModuleInterceptor implements HandlerInterceptor {

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
		//取出用户有权限的模块
		List<Module> modules = (List<Module>) request.getSession().getAttribute("allModules");
		//取出用户当前访问的模块
		Integer moduleId = (Integer) request.getSession().getAttribute("currentModule");
		
		if (moduleId < 0) {
			return true;
		}
		
		//判断有权限的模块是否包含当前访问模块
		for (Module m : modules) {
			if (m.getModule_id() == moduleId) {
				return true;
			}
		}
		response.sendRedirect(request.getContextPath()+"/login/noPower.do");
		return false;
	}

}
