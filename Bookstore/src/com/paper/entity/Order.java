package com.paper.entity;

import java.sql.Timestamp;

public class Order {
	private int id;
	private int userid;
	private byte status;
	private Timestamp createtime;
	private Timestamp dealtime;
	private double total;
	private String address;
	private boolean hide;
	public Order() {}
	public Order(int id, byte status) {
		this.id = id;
		this.status = status;
	}
	public Order(int userid, Timestamp createtime, double total, boolean hide) {
		this.userid = userid;
		this.createtime = createtime;
		this.total = total;
		this.hide = hide;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public byte getStatus() {
		return status;
	}
	public void setStatus(byte status) {
		this.status = status;
	}
	public Timestamp getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}
	public Timestamp getDealtime() {
		return dealtime;
	}
	public void setDealtime(Timestamp dealtime) {
		this.dealtime = dealtime;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public boolean isHide() {
		return hide;
	}
	public void setHide(boolean hide) {
		this.hide = hide;
	}
}