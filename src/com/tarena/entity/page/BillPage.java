package com.tarena.entity.page;

public class BillPage extends Page {

	private static final long serialVersionUID = 1L;
	
	private String idcard_no; 	//身份证
	
	private String real_name;	//姓名
	
	private String login_name;	//登录名
	
	private Integer bill_month;	//年月
	
	private Integer year;		//年份
	
	private Integer month;		//月份
	
	public BillPage() {
	}

	public String getIdcard_no() {
		return idcard_no;
	}

	public void setIdcard_no(String idcard_no) {
		this.idcard_no = idcard_no;
	}

	public String getReal_name() {
		return real_name;
	}

	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}

	public String getLogin_name() {
		return login_name;
	}

	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}
	public Integer getBill_month() {
		if (month != 0 && year != 0) {
			if (month > 0 && month < 10) {
				return Integer.valueOf(year.toString()+"0"+month.toString());
			}else {
				return Integer.valueOf(year.toString()+month.toString());
			}
		}
		else {
			return bill_month;
		}
	}

	public void setBill_month(Integer bill_month) {
		this.bill_month = bill_month;
	}
}
