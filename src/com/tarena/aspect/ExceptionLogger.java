package com.tarena.aspect;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import com.tarena.entity.Admin;

/**
 * 方面组件，用于在系统发生异常时记录日志
 * 
 * @author Jsong
 */
@Component
@Aspect
public class ExceptionLogger {
	
	@Resource
	private HttpServletRequest request;
	
	@Around("within(com.tarena.controller..*)")
	public Object log(ProceedingJoinPoint p){
		Object obj = null ;
		try {
			obj = p.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
			//记录异常日志
			Admin admin = (Admin) request.getSession().getAttribute("admin");
			if (admin != null) {
				String name = admin.getName();
				String ip = request.getRemoteHost();
				String now = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
				String className = p.getTarget().getClass().getName();
				String method = p.getSignature().getName();
				String msg = "用户["+name+"] IP["+ip+"] 在"+now+"，执行"+className+"."+method+"()时，发生如下异常:";
				StackTraceElement[] elems = e.getStackTrace();
				for (StackTraceElement elem : elems) {
					msg += "\t" + elem.toString();
				}
				System.out.println(msg);
			}
			throw new RuntimeException(e);
		}
		return obj;
	}

}
