package com.tarena.entity;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;


/**
 * 账务账号实体类
 *
 * @author Jsong
 */
public class Account implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer account_id;		//账务账号ID
	
	private Integer recommender_id;	//推荐人ID
	
	private String login_name;		//用户名
	
	private String login_passwd;	//密码
	
	private String status;			//状态
	
	private Timestamp create_date;	//创建时间
	
	private Timestamp pause_date;	//暂停时间
	
	private Timestamp close_date;	//关闭时间
	
	private String real_name;		//真实姓名
	
	private String idcard_no;		//身份证号
	
	private Date birthdate;			//出生日期
	
	private String gender;			//性别
	
	private String occupation;		//职位
	
	private String telephone;		//电话
	
	private String email;			//邮箱
	
	private String mailaddress;		//通信地址
	
	private String zipcode;			//邮编
	
	private String qq;				//QQ
	
	private Timestamp last_login_time;	//最后登录时间
	
	private String last_login_ip;		//最后登录IP
	
	public Account() {
	}
	
	public Integer getAccount_id() {
		return account_id;
	}
	public void setAccount_id(Integer accountId) {
		account_id = accountId;
	}
	public Integer getRecommender_id() {
		return recommender_id;
	}
	public void setRecommender_id(Integer recommender_id) {
		this.recommender_id = recommender_id;
	}
	public String getLogin_name() {
		return login_name;
	}
	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}
	public String getLogin_passwd() {
		return login_passwd;
	}
	public void setLogin_passwd(String login_passwd) {
		this.login_passwd = login_passwd;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Timestamp create_date) {
		this.create_date = create_date;
	}
	public Timestamp getPause_date() {
		return pause_date;
	}
	public void setPause_date(Timestamp pause_date) {
		this.pause_date = pause_date;
	}
	public Timestamp getClose_date() {
		return close_date;
	}
	public void setClose_date(Timestamp close_date) {
		this.close_date = close_date;
	}
	public String getReal_name() {
		return real_name;
	}
	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}
	public String getIdcard_no() {
		return idcard_no;
	}
	public void setIdcard_no(String idcard_no) {
		this.idcard_no = idcard_no;
	}
	public Date getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMailaddress() {
		return mailaddress;
	}
	public void setMailaddress(String mailaddress) {
		this.mailaddress = mailaddress;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public Timestamp getLast_login_time() {
		return last_login_time;
	}
	public void setLast_login_time(Timestamp last_login_time) {
		this.last_login_time = last_login_time;
	}
	public String getLast_login_ip() {
		return last_login_ip;
	}
	public void setLast_login_ip(String last_login_ip) {
		this.last_login_ip = last_login_ip;
	}

	@Override
	public String toString() {
		return "Account [account_id=" + account_id + ", recommender_id="
				+ recommender_id + ", login_name=" + login_name
				+ ", login_passwd=" + login_passwd + ", status=" + status
				+ ", create_date=" + create_date + ", pause_date=" + pause_date
				+ ", close_date=" + close_date + ", real_name=" + real_name
				+ ", idcard_no=" + idcard_no + ", birthdate=" + birthdate
				+ ", gender=" + gender + ", occupation=" + occupation
				+ ", telephone=" + telephone + ", email=" + email
				+ ", mailaddress=" + mailaddress + ", zipcode=" + zipcode
				+ ", qq=" + qq + ", last_login_time=" + last_login_time
				+ ", last_login_ip=" + last_login_ip + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((account_id == null) ? 0 : account_id.hashCode());
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
		Account other = (Account) obj;
		if (account_id == null) {
			if (other.account_id != null)
				return false;
		} else if (!account_id.equals(other.account_id))
			return false;
		return true;
	}

}
