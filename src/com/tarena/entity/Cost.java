package com.tarena.entity;

import java.io.Serializable;

import java.sql.Timestamp;


/**
 * 资费实体类
 * 
 * @author Jsong
 */
public class Cost implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer cost_id;
	private String name;
	private Integer base_duration;
	private Double base_cost;
	private Double unit_cost;
	private String descr;
	private Timestamp creatime;
	private Timestamp startime;
	private String cost_type;
	private int status;
	
	public Cost() {
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Integer getCost_id() {
		return cost_id;
	}
	public void setCost_id(Integer cost_id) {
		this.cost_id = cost_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getBase_duration() {
		return base_duration;
	}
	public void setBase_duration(Integer base_duration) {
		this.base_duration = base_duration;
	}
	public Double getBase_cost() {
		return base_cost;
	}
	public void setBase_cost(Double base_cost) {
		this.base_cost = base_cost;
	}
	public Double getUnit_cost() {
		return unit_cost;
	}
	public void setUnit_cost(Double unit_cost) {
		this.unit_cost = unit_cost;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public Timestamp getCreatime() {
		return creatime;
	}
	public void setCreatime(Timestamp creatime) {
		this.creatime = creatime;
	}
	public Timestamp getStartime() {
		return startime;
	}
	public void setStartime(Timestamp startime) {
		this.startime = startime;
	}
	public String getCost_type() {
		return cost_type;
	}
	public void setCost_type(String cost_type) {
		this.cost_type = cost_type;
	}
	
	
	@Override
	public String toString() {
		return "Cost [cost_id=" + cost_id + ", name=" + name
				+ ", base_duration=" + base_duration + ", base_cost="
				+ base_cost + ", unit_cost=" + unit_cost + ", descr=" + descr
				+ ", creatime=" + creatime + ", startime=" + startime
				+ ", cost_type=" + cost_type + ", status=" + status + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cost_id == null) ? 0 : cost_id.hashCode());
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
		Cost other = (Cost) obj;
		if (cost_id == null) {
			if (other.cost_id != null)
				return false;
		} else if (!cost_id.equals(other.cost_id))
			return false;
		return true;
	}
	
}
