package com.tarena.entity.page;

public class DetailPage extends Page {

	private static final long serialVersionUID = 1L;
	
	private Integer item_id;
	
	private Integer service_id;
	
	public DetailPage() {
	}

	public Integer getItem_id() {
		return item_id;
	}

	public void setItem_id(Integer item_id) {
		this.item_id = item_id;
	}

	public Integer getService_id() {
		return service_id;
	}

	public void setService_id(Integer service_id) {
		this.service_id = service_id;
	}

}
