package com.bwjf.entity;

import java.util.Date;

/**
 * @author 张恭雨
 * 创建时间：2017年11月14日 下午2:34:18
 * 类描述：绩效信息实体类
 * 版本：v1.0 
 */
public class PerformanceInfoVo {
	private int PerformanceInfoId;			//绩效信息编号（主键）	
	private String type;					//类型
	private int equipmentId;				//设备编号（外键）
	private int serviceChargeId;			//服务费编号（外键）
	private int quantity;					//数量
	private Date createDate;				//创建时间
	private Date updateDate;				//更新时间
	private int isInvoice;					//是否开具发票（1：是  0：否）	
	public int getPerformanceInfoId() {
		return PerformanceInfoId;
	}
	public void setPerformanceInfoId(int performanceInfoId) {
		PerformanceInfoId = performanceInfoId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getEquipmentId() {
		return equipmentId;
	}
	public void setEquipmentId(int equipmentId) {
		this.equipmentId = equipmentId;
	}
	public int getServiceChargeId() {
		return serviceChargeId;
	}
	public void setServiceChargeId(int serviceChargeId) {
		this.serviceChargeId = serviceChargeId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public int getIsInvoice() {
		return isInvoice;
	}
	public void setIsInvoice(int isInvoice) {
		this.isInvoice = isInvoice;
	}
	
}
