package com.tarena.entity.page;

import java.io.Serializable;


/**
 * 资费模块的分页条件
 * 
 * @author Jsong
 */
public class CostPage extends Page  implements Serializable{
	
	private static final long serialVersionUID = 1L;

	//基本时长排序条件，ture为增序，false为降序
	private Boolean baseDuration;
	
	private Boolean baseCost;	//基本费用排序条件
	
	public CostPage() {
	}

	public CostPage(int currentPage, int pageSize) {
		super(currentPage, pageSize);
	}
	
	public CostPage(Boolean baseDuration, Boolean baseCost) {
		this.baseDuration = baseDuration;
		this.baseCost = baseCost;
	}
	
	public CostPage(int currentPage, int pageSize , Boolean baseDuration, Boolean baseCost) {
		super(currentPage, pageSize);
		this.baseDuration = baseDuration;
		this.baseCost = baseCost;
	}

	
	public Boolean getBaseDuration() {
		return baseDuration;
	}

	public void setBaseDuration(Boolean baseDuration) {
		this.baseDuration = baseDuration;
	}

	public Boolean getBaseCost() {
		return baseCost;
	}

	public void setBaseCost(Boolean baseCost) {
		this.baseCost = baseCost;
	}

}
