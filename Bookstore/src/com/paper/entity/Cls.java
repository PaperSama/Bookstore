package com.paper.entity;

public class Cls {
	private int id;
	private String cls;
	public Cls() {}
	public Cls(int id, String cls) {
		this.id = id;
		this.cls = cls;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCls() {
		return cls;
	}
	public void setCls(String cls) {
		this.cls = cls;
	}
}