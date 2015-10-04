package com.tarena.util;

import java.beans.PropertyEditorSupport;
import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 * 时间类型转换工具类
 * 
 * @author Jsong
 */
public class DateEditor extends PropertyEditorSupport {
	
	private String pattern = "yyyy-MM-dd";
	
	public DateEditor() {
	}

	public DateEditor(String pattern) {
		super();
		this.pattern = pattern;
	}

	/* 
	 * 	表单中的日期字符串，我们的目的是
	 * 	按照指定格式将它转换为java.sql.Date
	 */
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if (text == null || text.length() == 0) {
			setValue(null);
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			//将表单中日期格式化
			String dateStr = sdf.format(Date.valueOf(text));
			//将格式化后的日期转型成java.sql.Date，并覆盖原有的数据
			setValue(Date.valueOf(dateStr));
		}
	}
	
}
