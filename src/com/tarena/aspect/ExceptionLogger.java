package com.tarena.aspect;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
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
//@Component
//@Aspect
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
			Logger logger = Logger.getLogger(this.getClass());
			Admin admin = (Admin) request.getSession().getAttribute("admin");
			if (admin != null) {
				String name = admin.getName();
				String ip = request.getRemoteHost();
				String now = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
				String className = p.getTarget().getClass().getName();
				String method = p.getSignature().getName();
				StringBuffer msg = new StringBuffer();
				msg.append("用户[").append(name).append("],");
				msg.append("IP[").append(ip).append("],");
				msg.append("在[").append(now).append("],");
				msg.append("执行[").append(className).append(".").append(method).append("()]时，发生如下异常:\n");
				
				StackTraceElement[] elems = e.getStackTrace();
				for (StackTraceElement elem : elems) {
					msg.append("\t"+elem.toString()+"\n");
				}
				logger.error(msg.toString());
			}
			throw new RuntimeException(e);
		}
		return obj;
	}

}
