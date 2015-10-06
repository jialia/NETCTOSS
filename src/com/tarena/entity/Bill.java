package com.tarena.entity;

import java.io.Serializable;

/**
 * 账单实体类
 * 
 * @author Jsong
 */
public class Bill implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private Integer bill_id;	//账单Id
	
	private Integer account_id;	//账务账号id
	
	private Integer bill_month;	//年月
	
	private double cost;		//费用
	
	private int payment_mode;	//支付方式
	
	private int pay_state;		//支付状态
	
	private String idcard_no; 	//身份证
	
	private String real_name;	//姓名
	
	private String login_name;	//登录名
	
	public Bill() {
	}

	public Integer getBill_id() {
		return bill_id;
	}

	public void setBill_id(Integer bill_id) {
		this.bill_id = bill_id;
	}

	public Integer getAccount_id() {
		return account_id;
	}

	public void setAccount_id(Integer account_id) {
		this.account_id = account_id;
	}

	public String getBill_month() {
		String month = bill_month.toString();
		return month.substring(0, 4) + "年" + month.substring(4)+"月";
	}

	public void setBill_month(Integer bill_month) {
		this.bill_month = bill_month;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public int getPayment_mode() {
		return payment_mode;
	}

	public void setPayment_mode(int payment_mode) {
		this.payment_mode = payment_mode;
	}

	public int getPay_state() {
		return pay_state;
	}

	public void setPay_state(int pay_state) {
		this.pay_state = pay_state;
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


	@Override
	public String toString() {
		return "Bill [bill_id=" + bill_id + ", account_id=" + account_id
				+ ", bill_month=" + bill_month + ", cost=" + cost
				+ ", payment_mode=" + payment_mode + ", pay_state=" + pay_state
				+ ", idcard_no=" + idcard_no + ", real_name=" + real_name
				+ ", login_name=" + login_name + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bill_id == null) ? 0 : bill_id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Bill other = (Bill) obj;
		if (bill_id == null) {
			if (other.bill_id != null)
				return false;
		} else if (!bill_id.equals(other.bill_id))
			return false;
		return true;
	}
	
}
